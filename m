Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A704F3AC0C2
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307356; cv=none; b=Jpn31dWzGXdN3yjQpXXkc2b0Al9Okemw/KA8CFkGjPvJg5d5DWW2RSojVgnbBRHK4rEA1JsxVXJYltF3wnmDi1aBMxOV8kWfGH01Ugk/LgYItQ6cUUcUbnDBFCmCZ1Uhgkzbw7T/GcKhhUQllfKbnSvkDfoe/VgwZrGh9mhaQLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307356; c=relaxed/simple;
	bh=24ElsADEh06edAjikGY7oCnUpIBZeIN0N6fSfPxfVsM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/t21kdzX28LgcFEwlgM6cnUI1a2brnPsP+g9r/SyZE/fz6bc9+gHAihD1FsGkF6ut2oiKdnPd24eikBTfQC+z1XY6HiWFNgWaYN6uazUSPBwsnwMPvi1/BGAJU4xLGv3PTjirLv86kWwQl+68Gx3mB4G5SeOl+3WKm7oPWNkZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=6JkL7gQm; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="6JkL7gQm"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wxLy6-00000003T0Q-0PnG;
	Fri, 21 Aug 2026 11:55:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=fdbqfJ7QvYonUWlTYQvntCdh+ZP0kQrA2filCMbzWPo=; t=1787306122; x=1788515722; 
	b=6JkL7gQm024u8eahVH27fm4tvVWzUVZ2XuM+tfzr0YJeUJ6B+PUNUKQjPQe4y2OH/Pmflok6OvA
	yqIN7n7WiRr0OIF0Kc2svlzEUkOAGj0dUlB3LV4kwwK9+pLiphk+RztHLGfvaT1Z/QIAZgTWBFcgJ
	xm4tDAgt2V/gkXHYAaPGF+gthPYrCb+3S5ZP2IDvhTpJcpwDo4unqUmT87braVhtT35iP9yPKZQHn
	oF1Y5qMc19PVl7G1Lp616HE7yKUTnKDALe8ZGxmcc8IbquBef9cKr/NShMYiramYTbz9EHInSYFtJ
	L+0pgEpPhUv/K1An1IrxRDsxVCMCiFdP60ow==;
Date: Fri, 21 Aug 2026 11:55:05 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: =?UTF-8?B?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC00Lg=?=
 =?UTF-8?B?0L3QvtCy0LjRhw==?= <r.zhambakiev@prosoftsystems.ru>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, "Tony Lindgren"
 <tony@atomide.com>, Lee Jones <lee@kernel.org>, Grygorii Strashko
 <grygorii.strashko@ti.com>, Marcin Niestroj <m.niestroj@grinn-global.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "mfd@lists.linux.dev" <mfd@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
 <lvc-project@linuxtesting.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] mfd: tps65217: Fix NULL pointer dereference on IRQ
 init failure
Message-ID: <20260821115505.6942aeae@kemnade.info>
In-Reply-To: <20260821075331.131315-2-r.zhambakiev@prosoftsystems.ru>
References: <20260821075331.131315-1-r.zhambakiev@prosoftsystems.ru>
	<20260821075331.131315-2-r.zhambakiev@prosoftsystems.ru>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Aug 2026 07:53:58 +0000
=D0=96=D0=B0=D0=BC=D0=B1=D0=B0=D0=BA=D0=B8=D0=B5=D0=B2 =D0=A0=D0=B0=D0=B4=
=D0=B8=D0=B9 =D0=A0=D0=B8=D0=BA=D0=B0=D1=80=D0=B4=D0=B8=D0=BD=D0=BE=D0=B2=
=D0=B8=D1=87 <r.zhambakiev@prosoftsystems.ru> wrote:

> tps65217_probe() ignores the return value of tps65217_irq_init(), so
> when the irq domain creation fails the probe still completes and the
> driver ends up bound with a NULL tps->irq_domain. Unloading the
> module then makes tps65217_remove() call irq_domain_remove() on the
> NULL pointer and oops the kernel. On top of that, irq_find_mapping()
> may fall back to the default irq domain and dispose of mappings that
> belong to other interrupt controllers.
>=20
> Check the return value and abort the probe on failure so the error
> is reported and no inconsistent state is left for removal.
>=20
> Fixes: 6556bdacf646fcaa ("mfd: tps65217: Add support for IRQs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

> ---
>  drivers/mfd/tps65217.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index c240fac0ede7..2d04d9e0ae29 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
> @@ -333,7 +333,9 @@ static int tps65217_probe(struct i2c_client *client)
>  	}
> =20
>  	if (client->irq) {
> -		tps65217_irq_init(tps, client->irq);
> +		ret =3D tps65217_irq_init(tps, client->irq);
> +		if (ret)
> +			return ret;
>  	} else {
>  		int i;
> =20

