{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "ia-writer-mono";
  version = "0-unstable-2023-06-16";

  src = fetchFromGitHub {
    owner = "iaolo";
    repo = "iA-Fonts";
    rev = "f32c04c3058a75d7ce28919ce70fe8800817491b";
    hash = "sha256-2T165nFfCzO65/PIHauJA//S+zug5nUwPcg8NUEydfc=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    find iA\ Writer\ Mono/Variable/ -name '*.ttf' -exec install -D -t "$out/share/fonts/truetype/" {} \;

    runHook postInstall
  '';

  meta = {
    description = "iA Writer Mono Typeface";
    homepage = "https://ia.net/topics/in-search-of-the-perfect-writing-font";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
    maintainers = [ lib.maintainers.richardjacton ];
  };
}
