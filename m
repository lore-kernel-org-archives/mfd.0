Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3105832D7C7;
	Sat, 11 Jul 2026 06:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783750343; cv=none; b=IRDKDNR07KVx/d9Tru12rMbT4STQuiY4YW3bI9iNi04zpV/0uau250iDpWBvPH5FVaZLe1WTNIV2MRD2GoyvLcsuESqDbNryS+dgZLvbTiBbV4YEQPjsQq4czYuWFe4xUiCnmnCmgRzhp3z5e+PIxponNh/NSU9SCwlk9A+9DpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783750343; c=relaxed/simple;
	bh=ikKB9K29DCxIAdBLTdCldzXYeQ/7AIsKNVLSBT6mGp4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AdYkYgeQ51LECDK3A6fVeL/oy8INFt2w0kEUZkko+NbDi0xETj8lumdwr3Q7PQ+lW2QzVBxT0KzsS31huipMYHTrZFZoP5DIY2dQ+Wd7xOyrsqSWOWJ+y1itaH5kL9F3dtfAcmjNtL6hQz7AlW6Fc8ZmB0a9BCw0FV+VuvkB85Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSXgJAF2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSXgJAF2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D3F1F000E9;
	Sat, 11 Jul 2026 06:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783750341;
	bh=Ue++4tEje5OlkE7liOfBIL1ANaalVmys113Ckduq/PY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RSXgJAF2yJ8PTzLZEZtlD9Q0dR8cTAQWAnnQWeVNDUJzw+fFR5ryiSO2by0pEXdMq
	 PT5y4wNRoiJYjDbPSFCREQ6m02mOEqHE+dTGLj6uxeHtno0+m9CAjm5xFmG+jJ6RGD
	 PonFLRfh/mpKJCk7BJE6iWlNuMryZH1kK53v8RPcIEKW1Shd8JRE+i7jh+HmgdH4Fe
	 RNwTH7K+HAS1jvQTAerAQ8orKHnLBLD2DTxhfiTLG6RxDlqW0+SaFYowUXTkl31FXP
	 Y6SLM8FyvayTy+6EOPcg1QLEYinM61q5wHXswSFyoozHPjVnDTHD0iHNsoPOE/xtw8
	 qbLlnR5xSkW1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/16] ASoC: twl4030-codec: Allow setting APLL rate
 through the .set_sysclk() interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <7ea589f951baf1e217c7169ae21c0bf510672ecf.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <7ea589f951baf1e217c7169ae21c0bf510672ecf.1783749722.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 06:12:20 +0000
Message-Id: <20260711061220.A7D3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing cleanup on write failure in `twl4030_perform_writes()` lea=
ves the codec permanently disabled.
- [Medium] `twl4030_hw_params()` completely ignores the return value of bat=
ch register writes, masking hardware configuration failures.
--

--- Patch [6]: [PATCH 06/16] ASoC: twl4030-codec: Allow setting APLL rate t=
hrough the .set_sysclk() interface ---
commit db9973d614eb8b37cb4d8a6cf9cada8e9b6d1cf8
Author: Grond <grond66@riseup.net>
Subject: ASoC: twl4030-codec: Allow setting APLL rate through the .set_sysc=
lk() interface

This patch allows setting the APLL rate through the .set_sysclk() interface
for devices where the APLL drives audio clocks, but playback bypasses the
standard .hw_params() path. It extracts the APLL rate calculation into a
helper and introduces batch register write functions.

> diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
> index 9476cdfd4dde9..ff36679166e20 100644
> --- a/sound/soc/codecs/twl4030.c
> +++ b/sound/soc/codecs/twl4030.c
> @@ -198,6 +198,38 @@ static void twl4030_codec_enable(struct snd_soc_comp=
onent *component, int enable
>  	udelay(10);
>  }
> =20
> +static int twl4030_perform_writes(struct snd_soc_component *component,
> +				  const unsigned int *regs,
> +				  const unsigned int *vals,
> +				  unsigned int n)
> +{
> +	struct twl4030_priv *twl4030 =3D snd_soc_component_get_drvdata(componen=
t);
> +	int reboot_codec =3D twl4030->codec_powered;
> +	unsigned int i;
> +	int ret;
> +
> +	if (reboot_codec)
> +		twl4030_codec_enable(component, 0);
> +
> +	for (i =3D 0; i < n; ++i) {
> +		ret =3D twl4030_write(component, regs[i], vals[i]);
> +		if (ret)
> +			return ret;

[Severity: High]
If twl4030_write() fails and returns early, will it leave the codec permane=
ntly
disabled because we skip the twl4030_codec_enable(component, 1) call? This
seems to cause a hardware state mismatch where the ALSA core considers the
codec powered on, but it remains physically powered off.

> +	}
> +
> +	if (reboot_codec)
> +		twl4030_codec_enable(component, 1);
> +
> +	return 0;
> +}

[ ... ]

> @@ -1775,20 +1824,12 @@ static int twl4030_hw_params(struct snd_pcm_subst=
ream *substream,
>  		return -EINVAL;
>  	}
> =20
> -	if (format !=3D old_format || mode !=3D old_mode) {
> -		if (twl4030->codec_powered) {
> -			/*
> -			 * If the codec is powered, than we need to toggle the
> -			 * codec power.
> -			 */
> -			twl4030_codec_enable(component, 0);
> -			twl4030_write(component, TWL4030_REG_CODEC_MODE, mode);
> -			twl4030_write(component, TWL4030_REG_AUDIO_IF, format);
> -			twl4030_codec_enable(component, 1);
> -		} else {
> -			twl4030_write(component, TWL4030_REG_CODEC_MODE, mode);
> -			twl4030_write(component, TWL4030_REG_AUDIO_IF, format);
> -		}
> +	if (format !=3D old_format || s) {
> +		regs[0] =3D TWL4030_REG_CODEC_MODE;
> +		vals[0] =3D mode;
> +		regs[1] =3D TWL4030_REG_AUDIO_IF;
> +		vals[1] =3D format;
> +		twl4030_perform_writes(component, regs, vals, ARRAY_SIZE(regs));

[Severity: Medium]
Does this code ignore the return value of twl4030_perform_writes()?
If the batch register writes fail, it seems the hardware remains unconfigur=
ed
but the function will still return 0 (success) and falsely advance the stre=
am
state.

>  	}
> =20
>  	/* Store the important parameters for the DAI configuration and set

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783749722.gi=
t.hns@goldelico.com?part=3D6
