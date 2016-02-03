package io.github.mufasa1976.installApex.exception;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.core.io.Resource;

public class ApexParserException extends InstallApexException {

  private static final long serialVersionUID = -4401991686028363393L;

  private static final String KEY_PREFIX = "apexParserException.";
  private static final String REASON_PREFIX = "reason.";
  private static final String MESSAGE_KEY = KEY_PREFIX + "message";

  private Reason reason;
  private Resource apexDirectory;

  public ApexParserException(Resource apexDirectory, Reason reason) {
    this(apexDirectory, reason, null);
  }

  public ApexParserException(Resource apexDirectory, Reason reason, Throwable cause) {
    super(MESSAGE_KEY, cause, apexDirectory);
    setPrintStackTrace(true);
    this.apexDirectory = apexDirectory;
    this.reason = reason;
  }

  @Override
  public String getMessage(MessageSource messageSource, Locale locale) {
    List<Object> arguments = new ArrayList<>(getArguments());
    if (reason != null) {
      arguments.add(messageSource.getMessage(reason.getMessageKey(), new Object[] { apexDirectory }, locale));
    }
    return messageSource.getMessage(super.getMessage(), arguments.toArray(), locale);
  }

  public static enum Reason {
    RESOURCE_NOT_FOUND("resourceNotFound");

    private String messageKey;

    private Reason(String messageKey) {
      this.messageKey = messageKey;
    }

    public String getMessageKey() {
      return KEY_PREFIX + REASON_PREFIX + messageKey;
    }

  }

}
