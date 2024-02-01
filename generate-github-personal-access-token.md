# Generate GitHub Personal Access Token

### Open GitHub Developer Settings

Visit https://github.com/settings/tokens for easy access.

Alternatively you can follow:
1. Visit https://github.com/
2. Click on Profile icon located at the upper right corner.
3. Click on setting option appeared on the pallet.
![Screenshot showing profile pallet](./public/images/github_settings.jpg)
4. From the left nevigation menu select Developer Settings.
![Screenshot showing left nevigation menu of github profile](./public/images/github_profile_left_nevigation_menu.jpg)
5. Click on Personal access tokens
![](./public/images/personal_access_token.jpg)
6. Click on Fine-grained tokens.
![](./public/images/fine_grained_tokens.jpg)

### Generate new Token

1. Click on Generate new token.
![](./public/images/generate_new_token.jpg)
2. Enter password.
3. Enter `Token name` as `automation-access-token`
4. Keep `Expiration` to default or make it 1 year if you want it for long term use.
5. Make `Repository access` to `All repositories`.
6. In `Permissions` under `Repository permissions` give `Read-only` access to Administration.
7. Click `Generate token`, and there you have it!