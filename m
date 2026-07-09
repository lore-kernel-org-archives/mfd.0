Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13172399CE2
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616944; cv=none; b=JpZJUriFMYEIL6IFjolyWvFujLOVY/lMPT5qT0afMP12cAPYu9fD/VBP2ZW7ghQCJywSMbD7j4fsjpmkeCWkDWWdCk1y9DXbaRzveafUZnrvPLmWCZ9c0zpMirdXlSsrvUFtkG5tE5M87/tJ/WJZNB2dJWSVvUa8dekKEQj10rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616944; c=relaxed/simple;
	bh=p/O5e5FkxULi131CyVFllWQwyDtzZzswDUCNwCnwNoo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f2p8I5XIKejkcyYEPbcO/9tzzTFvGFjsb0hW+YkFRlABOP9kHmhlebwR1sqajBzU3lmbMA0juEdQPme/NCf4g9eoybXabpKJ3Fz5CHK+wAdXexqI38IX9kcMLYseAanT0Bg7Mr5rPGye3sl9BwqfpdtMW7nY4siz/6E2WFK8RIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oE6LolL+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oE6LolL+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD381F00A3D;
	Thu,  9 Jul 2026 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616942;
	bh=qldLcJdfpmReh1tcMTeqViXNq54QY2XE9aHMda55tGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oE6LolL+XG57dtCWlwQmkfA88RMQb0cMmnOkoBbPxihM8YD+6nOY39axXjUkZSmlp
	 C5iWICWnZXe9B0UDs1/Yog2ExFnC4F9PLwit6k11jUFGFIlMvaaM3L0V3a34ONUgUg
	 uuGh+6rzsHegi3F8MBsotnMhZ7fDSbA9nldFnij0YMJ8xIn0jQjahUvZIw1ZX17G1y
	 S/BqUS/YFdrqZE9SRrxUQgSvJd9IWFUD12p7hOndUrU7VCCmrWaXunghaE5e6zoxRb
	 ts6scum+wN2CgtA/SClcnKP960yGnyq4++VZACWfCIFVMuFfA/grT6mw2Pa+8Q34XG
	 XhM47vpJClZiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/23] mfd: Drop unused assignment of spi_device_id
 driver data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <0f1fd857e1b34e69f83fbc784b10d2dc608b2494.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <0f1fd857e1b34e69f83fbc784b10d2dc608b2494.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:09:01 +0000
Message-Id: <20260709170902.5BD381F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit message prefix does not strictly follow the MFD subsyste=
m naming conventions.

Pre-existing issues:
- [High] The parent MFD driver pre-initializes private regmaps for its chil=
d devices instead of letting the child drivers initialize their own resourc=
es.
--

--- Patch [10]: [PATCH v3 10/23] mfd: Drop unused assignment of spi_device_=
id driver data ---
commit d3c0fc78984e725224985bb47dbbc9cc063396eb
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Drop unused assignment of spi_device_id driver data

This commit removes explicit zero assignments to the driver_data member of
struct spi_device_id arrays across multiple MFD SPI drivers. It cleans up
the source representation without modifying the compiled arrays.

> mfd: Drop unused assignment of spi_device_id driver data

[Severity: Low]
This isn't a bug, but does the commit message subject omit the mandatory
driver name component?

The MFD subsystem guidelines specify using the format "mfd: <Driver>:
<Capitalized description>". Since this patch touches multiple SPI drivers,
would it be better to use a prefix like "mfd: spi:" or "mfd: core:" to
adhere to the established conventions?

> diff --git a/drivers/mfd/ocelot-spi.c b/drivers/mfd/ocelot-spi.c
> index fc30663824bb1..3c8260c7f8fb1 100644
> --- a/drivers/mfd/ocelot-spi.c
> +++ b/drivers/mfd/ocelot-spi.c
> @@ -270,7 +270,7 @@ static int ocelot_spi_probe(struct spi_device *spi)
>  }
> =20
>  static const struct spi_device_id ocelot_spi_ids[] =3D {
> -	{ "vsc7512", 0 },
> +	{ "vsc7512" },

[Severity: High]
This is a pre-existing issue, but does the Ocelot core driver pre-initialize
private regmaps for its child devices instead of letting the child drivers
initialize their own resources?

Looking at the Ocelot core implementation:

drivers/mfd/ocelot-core.c:ocelot_core_try_add_regmaps() {
        int i;

        for (i =3D 0; i < cell->num_resources; i++)
                ocelot_core_try_add_regmap(dev, &cell->resources[i]);
}

The parent iterates over the child cells' resources to preemptively initial=
ize
regmaps. The MFD subsystem guidelines advise against parent-initialized pri=
vate
resources because they introduce tight coupling, make refactoring fragile, =
and
can lead to silent use-after-free bugs if lifetime mismatches occur.

Since each child gets a discrete regmap from its own resources, should the
child drivers initialize their own regmaps rather than relying on the paren=
t?

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(spi, ocelot_spi_ids);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D10
