package org.webstories.web.convention.pages.error.logon;


public class FBEmailMatchingErrorObject extends LogonErrorObject {
	private LogonErrorType type;
	private String inviteEmail;
	private String userEmail;
	public FBEmailMatchingErrorObject( FBEmailMatchingErrorObjectFactory factory ) {
		super( factory );
		this.type = factory.createType();
		this.inviteEmail = factory.createInviteEmail();
		this.userEmail = factory.createUserEmail();
	}
	@Override
	public LogonErrorType getType() {
		return type;
	}
	public String getInviteEmail() {
		return inviteEmail;
	}
	public String getUserEmail() {
		return userEmail;
	}
}
