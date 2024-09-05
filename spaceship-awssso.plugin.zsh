#
# AWS SSO
#
# Foobar is a supa-dupa cool tool for making you development easier.
# Link: https://www.foobar.xyz

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_AWSSSO_SHOW="${SPACESHIP_AWSSSO_SHOW=true}"
SPACESHIP_AWSSSO_ASYNC="${SPACESHIP_AWSSSO_ASYNC=true}"
SPACESHIP_AWSSSO_PREFIX="${SPACESHIP_AWSSSO_PREFIX="using "}"
SPACESHIP_AWSSSO_SUFFIX="${SPACESHIP_AWSSSO_SUFFIX=" (sso) "}"
SPACESHIP_AWSSSO_SYMBOL="${SPACESHIP_AWSSSO_SYMBOL="☁️ "}"
SPACESHIP_AWSSSO_COLOR="${SPACESHIP_AWSSSO_COLOR="216"}"

# Check if command exists in $PATH (from spaceship main implementation)
# USAGE:
#   _exists <command>
_exists() {
  command -v $1 > /dev/null 2>&1
}

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show foobar status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_awssso() {
  # If SPACESHIP_AWSSSO_SHOW is false, don't show foobar section
  [[ $SPACESHIP_AWSSSO_SHOW == false ]] && return

# Check if the AWS-cli is installed
  _exists aws-sso version  || return

  # Check if current profile is available
  [[ -n $AWS_SSO_PROFILE ]] || return

  local aws_sso_profile="$(echo "$AWS_SSO_PROFILE")"


  # Display aws_sso section
  # spaceship::section utility composes sections. Flags are optional
  spaceship::section \
    --color "$SPACESHIP_AWSSSO_COLOR" \
    --prefix "$SPACESHIP_AWSSSO_PREFIX" \
    --suffix "$SPACESHIP_AWSSSO_SUFFIX" \
    --symbol "$SPACESHIP_AWSSSO_SYMBOL" \
    "$aws_sso_profile"
}
