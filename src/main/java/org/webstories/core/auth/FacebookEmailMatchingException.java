package org.webstories.core.auth;

public class FacebookEmailMatchingException extends FacebookAuthenticationException {
	private static final long serialVersionUID = 1;
	private String inviteEmail;
	private String userEmail;
	public FacebookEmailMatchingException( String inviteEmail, String userEmail ) {
		super(
			String.format(
				"O seu e-mail é %s, mas este convite já foi utilizado por %s.",
				userEmail,
				inviteEmail
			)
		);
		this.inviteEmail = inviteEmail;
		this.userEmail = userEmail;
	}
	public FacebookEmailMatchingException( Throwable cause ) {
		super( cause );
	}
	public String getInviteEmail() {
		return inviteEmail;
	}
	public String getUserEmail() {
		return userEmail;
	}
}
