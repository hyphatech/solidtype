import * as I18n from "@kobalte/core/i18n";

function ShowsLocale() {
  const locale = I18n.useLocale();
  return <p>{locale.locale() + " " + locale.direction()}</p>;
}

export function make() {
  return (
    <I18n.I18nProvider locale="ar-EG">
      <ShowsLocale />
    </I18n.I18nProvider>
  );
}
