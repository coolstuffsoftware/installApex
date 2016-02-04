package io.github.mufasa1976.installApex.exception;

import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.testng.Assert;
import org.testng.annotations.Test;

import io.github.mufasa1976.installApex.AbstractInstallApexTestWithContext;
import io.github.mufasa1976.installApex.exception.InstallApexException.Reason;

public class TestInstallApexException extends AbstractInstallApexTestWithContext {

  @Autowired
  private MessageSource messageSource;

  @Test
  public void testAllExceptionMessagesAvailable() {
    for (Reason reason : InstallApexException.Reason.values()) {
      String messageKey = reason.getMessageKey();
      String message = messageSource.getMessage(messageKey, null, Locale.getDefault());
      Assert.assertNotNull(message);
      Assert.assertTrue(StringUtils.isNotBlank(message));
      Assert.assertNotEquals(messageKey, message, "No Message defined for Key " + messageKey);
    }
  }

}
