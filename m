Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E130449C4D7
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417710; cv=none; b=uq9rR2Rn2ciVEDyYFLE8cKTPMzQi8hvtW4wYnIjaz8STYEfJb/UKmgasF5LeygxPTrriXdOgtAV55wnSmiccudE4OHQeYpL/8u+xTNj3CDtikLm7AJSkdR2q8DJVRNHcQmuOrELvM8pJNBSMy4tLeZi84u8okZL+kt6pyhI+8Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417710; c=relaxed/simple;
	bh=FCSWSW6aKxZzFSyAAF7U4fs0v74ga41w6qQSEsg0ARk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eRaYAgoGkkLx5Qn3I9ITovzfuyvwjgTsh97wvyBqtd/d6k19Dm5IROTOs0UKj1mmIE2WE8zCdHHIO7xWur5c3EBcp4wMlIH+QbPsC7My5BEno1CYbzV4fumiAbUtm2lFyC8lZGEKmH291dGgQKxKtI75K8EAvvxtH850IIcQ/34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxhK6BwE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxhK6BwE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A991F000FF;
	Mon, 14 Sep 2026 20:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789417708;
	bh=eIDFqkBfe+sDsl9MtrfuFIG/JR3USizUkEW/xytCDLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jxhK6BwE/tjEaLC4l3nopBG+uOnyXKTBAs45KtRVwAHWjZjKogoMiLojEc3dyQFeI
	 AvH6Savxvt8RrkKTJCZkmDk5uy4rimUXmo5uND4BlozTeVhUgrJvZfzIFU9E7TrH/I
	 re3PWLXqlmjkrX+TDkjQdpUOe1D4/yGZYoKgSMwuhgC6t67ycicZ2nl8noFAZqJguT
	 ZX0yrUfuHY4UU43Ec3RMq+E3EkIwyg1vyPInCWvJhRqNBwoWs2WzlCpY6bSGjfbv1b
	 TVLdoQL+roP1zSbOS6gjiKB5SSCqoqIzoYPMKd3wlo1DJOqh8FQXYaDIkbGhF7SVL4
	 OOMHdL5Cqjtig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] mfd: rz-mtu3: do not use struct
 rz_mtu3_channel::dev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260914201456.2018403-2-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914201456.2018403-2-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 20:28:27 +0000
Message-Id: <20260914202828.46A991F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The patch replaces a standard API call with a bespoke pointer ar=
ithmetic helper to retrieve parent data, cementing an MFD architectural gui=
deline violation.
- [Low] The commit message description starts with a lowercase letter, viol=
ating MFD subsystem guidelines.
--

commit 8098c2550655f8bdfa6c7acd0a4b1dfbc4e57e2a
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

mfd: rz-mtu3: do not use struct rz_mtu3_channel::dev

Channels 1 and 2 are used by both the PWM and counter drivers. Both
subdrivers assign struct rz_mtu3_channel::dev to their own device
instance for those shared channels, so the value stored in it depends on
which subdriver binds last.

> mfd: rz-mtu3: do not use struct rz_mtu3_channel::dev

[Severity: Low]
Does this commit message subject violate the MFD subsystem formatting
conventions? The guidelines mandate capitalizing the description after the
subsystem prefix, e.g., "mfd: <Driver>: <Capitalized description>".

> diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> index 0a254e61ec0a5..d809436e2124c 100644
> --- a/drivers/mfd/rz-mtu3.c
> +++ b/drivers/mfd/rz-mtu3.c
> @@ -60,10 +60,17 @@ static bool rz_mtu3_is_16bit_shared_reg(u16 offset)
>  		offset =3D=3D RZ_MTU3_TCNTSA || offset =3D=3D RZ_MTU3_TCNTSB);
>  }
> =20
> +static inline struct rz_mtu3_priv *rz_mtu3_ch_to_priv(struct rz_mtu3_cha=
nnel *ch)
> +{
> +	struct rz_mtu3_channel *first_ch =3D ch - ch->channel_number;
> +	struct rz_mtu3 *mtu =3D container_of(first_ch, struct rz_mtu3, channels=
[0]);
> +
> +	return mtu->priv_data;
> +}

[Severity: Medium]
Does the introduction of rz_mtu3_ch_to_priv() violate MFD guidelines for
parent data access?

The MFD guidelines explicitly state that child drivers must directly access
parent data using standard APIs (like dev_get_drvdata) and to avoid writing
bespoke helpers in the parent.=20

While this replaces dev_get_drvdata(ch->dev->parent) to avoid depending on
subdriver-populated state, substituting it with a custom helper using point=
er
arithmetic (ch - ch->channel_number) tightly couples the implementation to
the physical layout of the channels array.

Could the child drivers be refactored to retrieve the parent data themselves
instead of introducing this bespoke accessor?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914201456.2018=
403-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D1
