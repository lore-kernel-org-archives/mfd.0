Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874F7542EC1
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081608; cv=none; b=cvFtveF1jLuHrSruxrqOAalqS5N2ZYVwos1mGpouKnxzXbu4qqoEUbPucPFBiAVlS1hgbaXzuFOo0aNT/aMkgOA7Jv+ZJ/TeTmfiI0zqQh1KyLMIJzNcmYkEqtLtL8P5QWKeLHqMkec1xW8BAvxFnlg8oVXDaD6RMNsej2q1tMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081608; c=relaxed/simple;
	bh=v4Ul7xXqzvPTm1KnAhXO58P90eD2KlGTNsegXWmzADU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuLuh4jpJ3ZlDhn5kyaBH0e/a9mtNmzZKVaCb50M0cTgc76bnSxbo4hNSbessNjcz3uSxfJeAWNwqdnzyY3SO9yi3x79FL+qPJXeOWisWSuh8eVcIIVM4QnOZUBNnHuaCEgTu+6nLu4rCr2yAtMXcYuVSgCY4z5ikYiqONshJcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=f0t9yfDE; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="f0t9yfDE"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so1434410f8f.1
        for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 05:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790081599; x=1790686399; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UsAsHIO1y8RCUKiEPTTkY3IWmv6reNZonvZkfCzW3Ag=;
        b=f0t9yfDEmFdw4vwahaUUgYPAbzMct7GOZdWFBggvNOoZfzW7Hql5R0wK7nZKI5bOIB
         to0wQo1P+y+mIOa0cK8tjZFh8766mT1ULbZoCNXia6H1kJNG76AUwnpbpsEZMFpZj0kX
         6PWMqvbv1KsBd7Yxt3b9hkjn6yZMM3GtyO/+N4ZewB0g3+dFGGO+M/OpBcslWlWTGpZR
         hZb45L5hM9dQX55B9a91xlXb8k7t706TxUZ2SyN52q46k5ZDblyoW7VpMN05gYnOFEYK
         qMToNmWYC73iuY6Chj/n9lXEZ9TKGasooPdAMEZ//fKTbSv0Kk3m5Fkx17CBxrlx+MC6
         bEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081599; x=1790686399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsAsHIO1y8RCUKiEPTTkY3IWmv6reNZonvZkfCzW3Ag=;
        b=UwMcClrvl1yu2Zluc2wN8i4LODb8C1BQxW0P9qYO8iXUHOGeES1ZQZ+LB2P9WYMUug
         I8nUaNL7Qqo3dZ8DmBNEmst+RikuM7z1FNeddVd/yf4pDWiZS0+TE9CTqFxl4oqQYN2D
         G0YXlO0KlhmT3MWjr5B0aojzVk73/91tyEHgk9nDiosXwY1Pa/x46XdMV54L8Df5UKa4
         ePfj6Ma2tXbSeE+L+EEYetHEJTDwgv7vXK+9hb6NY1Pj2MZvS4IWpcqn9xdhfyEJ95v7
         RLRZB2tW8ogCf7GyjTA9bg3AMmfLTTSxYUvfJjqWISn2kv2S+GE9MrScTRgN+XdUzc/f
         V7Fg==
X-Forwarded-Encrypted: i=1; AKwUvBwxgULB83ZqRrNxC8INLu+7uEAzoLecLLjbegx5RtfZDVEHbFlysTpDtQB44RdTV6XXdW8=@lists.linux.dev
X-Gm-Message-State: AFuF++nqgZg7NUnDi9fXlOc2s9P0jWIamUJx7DoNpYFu4qNA6jUFHs2p
	k5hX8472H2HFBIaZpgQ+izPXBzvGV++SdSaRVbkr1aRc2kuC+Ty1tvkxsVFhUNgbNgY=
X-Gm-Gg: AYBFou1LAl9dRH1RE/eoPZX7J5Qm8lQduMeVoJ17zp2WDR3noZXFigFk9/X0TzxSjM6
	rKqMTTqymP92KGCaYfsKWX+na+1HcHInTyrYg7uZDBxBlco+RArcQ0Ix6WJUqP56gAzCuTbDUby
	SbKiHoDupeNttTYhv067jW4g22kTPndPFCkTRPtVCVHOY2IvzIvg+ziIrunqMkI0x1fyxi6V5KO
	4ixzhFboU0CtkqCbsTlcZuUBbOSN9Pi1NSrGkAkDyBf2/ZxdXz5jEipyEgA58+G1DNq6HLeQtg6
	X4SPQqXr2odGwyIDlEcZEXOI91HbNWRtG3rjmP7IMmzN9jKaNKAf2fgzctXghASR8DiQxdQJwgC
	lnLtrh44sBkuh0KiZ7qtcuJ67rlIHR/0ZA8RQ84vPEKUHEy2rt3M+Lz8nKx+CdgXNCy3Z8Oqygs
	R9NqX0tiNmPedL9H9Fw39QPv0YFWpNrqRWtkgMHO9XtTHfVFMVnCsQfGPFimBykNwVWCrRWBee9
	MiGybtpn6112ezgsMcREQya8sxzggQO5Ut++inrr5HGU/Wn6DAH2vIJlV5xwA==
X-Received: by 2002:a05:6000:4608:b0:487:f31:857f with SMTP id ffacd0b85a97d-488610118bamr4476584f8f.15.1790081599025;
        Tue, 22 Sep 2026 05:53:19 -0700 (PDT)
Received: from localhost (p200300f65f19a9041d0e57515b2ea4c8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1d0e:5751:5b2e:a4c8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48862731a53sm4931099f8f.4.2026.09.22.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:53:18 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:53:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, kees@kernel.org, 
	gustavoars@kernel.org, p.zabel@pengutronix.de, daniel@riscstar.com, 
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
Message-ID: <arJ5gQmthKh2ayGg@monoceros>
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-4-elder@riscstar.com>
 <arA1svdQzaj3VanR@monoceros>
 <28ebbf27-24db-4b5f-87f0-831d13f93b8f@riscstar.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ztliwx3eij5ch7ku"
Content-Disposition: inline
In-Reply-To: <28ebbf27-24db-4b5f-87f0-831d13f93b8f@riscstar.com>


--ztliwx3eij5ch7ku
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
MIME-Version: 1.0

Hello Alex,

On Tue, Sep 22, 2026 at 07:37:53AM -0500, Alex Elder wrote:
> On 9/20/26 2:39 PM, Uwe Kleine-K=F6nig wrote:
> > On Fri, Sep 18, 2026 at 11:52:32AM -0500, Alex Elder wrote:
> > > +#include <linux/bits.h>
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/reset-controller.h>
> >=20
> > Please rely on linux/platform_device.h to provide of_device_id and drop
> > including <linux/mod_devicetable.h>. (If you want to go full iwyu,
> > include <linux/device-id/of.h> instead.)
>=20
> In general I would like to "go full iwyu" but have never heard
> it expressed that way.  Can you recommend a tool available that
> will help me do that?

There is `apt install iwyu`, but I only tried that shortly and didn't
manage to make it work nicely with-in the kernel.

> It looks like "mod_devicetable.h" doesn't help much unless I
> need struct_cpu_feature (which I do not), so I'll include "of.h".

Yeah, and for struct cpu_feature there is
https://lore.kernel.org/all/ef103a4b9e1cd7477fa52ee347c4ec301354fba9.178998=
8540.git.u.kleine-koenig@baylibre.com/
=2E
=20
> > > +static const struct of_device_id tc9564_clk_ids[] =3D {
> > > +	{ .compatible =3D "toshiba,tc9564-clock" },
> > > +	{ },
> > > +};
> >=20
> > Drop the trailing comma after the list terminator please.
>=20
> OK.  Only for the list terminator, right, because nothing
> will ever follow it?  Non-empty final initializer is OK
> to have a comma as far as you're concerned?

correct. A non-empty last item even should have a comma.

Best regards
Uwe

--ztliwx3eij5ch7ku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqyejsACgkQj4D7WH0S
/k47Vgf+MRlVLPMGuXHor1vwVO9Aio3Q8yy+NUEK/fWTE+YEMTA1w+6YqsgeiJ18
k46MRbkEremJC2B/gZElmlpu4paEu99Qg+kif1t+k21ZaiC9Kl71V2ue+dNtbP93
U6/uxACp6gAw5u3yAf2GFlAOJhCXVBaeVd25LntVeVdhRYQb48cp6V5Uo2C2ukK5
WfEPetJwrAilKQUBpNladzLOIXT4/xVdzLTl1kQCTeJ+k+4f9ubiLI5C6cJOsf2j
MC4jBXoimClS2rp5jMK42D8blKcvVDH4Z4X87FPzl1sqRy8EI+nFftpZt0hSW/ai
gYSqxdYQ0cXLyu2XzCARC0BSUETt/g==
=zJTm
-----END PGP SIGNATURE-----

--ztliwx3eij5ch7ku--
