Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B8C3382C9;
	Sat, 11 Jul 2026 06:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783750521; cv=none; b=Y44OBuNC0FMYMR/15AAP1GuxVztXdBVKm4Snpt3SVXHAZJR9uTCdHeTkli08vISrPYK9OdAyolr80RnItVNY+kg4n2RdS/m6h8c4MnkVmzDnvMxeRMP/gp7a9cPhUx9VWQPpboSdZQpCz9LnZ3RNUiFjiARE0IypOE2gAoDLxJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783750521; c=relaxed/simple;
	bh=j5WD6F35WcsLwjpTN7zbqgLtZfCG3MGX3KYhQOZoYTw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fwJlcpHVnGEKXz3lc57/Ji3w4Bo1D2mMl4cVBUxZYV9TeAiXzEKp5jhQCfS3DPElWLgGMQWJAl+CotaWEa0XWFNOnZLCaH5jU/TFaYNRvlzaCfHGFCst4ePpiyR285oDOTYdwUs0GJpc2jKLL2QyZgGKPZwEiF5oRi7mSRqbJOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWfBacBE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWfBacBE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D85B1F000E9;
	Sat, 11 Jul 2026 06:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783750519;
	bh=IaqbGV8uAIEG/Agce/1pJd9wDLJJ0ZMEyZkItpqei/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aWfBacBEgAIUoXyq088iQ27Gj0Lv//QGRJCwbPeE0Ob1ZvaMRvU19VrQhzTadE2Nt
	 899+Nt0IWZOSc2OpSBb8mir9FixzZmWOZwFJc2c+JGxd8S8X/g/CuH+zWVkraxAaTB
	 FEw6jfumG/hA37jVuH5ZR6TVhsMhowrK6ih3UZJDa3mExkNsHTaLOlvlty2UR0tWxY
	 6rYD35mYAuXxEoFQ6CObSZ+YUY1xrcJXteVqn2vBL4rP42/YTvUY9CGwN0fqkmcXIS
	 z/Ky+Fi7KP6kdW+qaeH8LQxMSBzp+BE+nUZLtWBhzKLqII8eRz7VKQ4jJPTDU3oB/J
	 GJABV2d3SK3/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/16] ASoC: omap3pandora: Rewrite sound card driver as
 a platform driver with DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <9274200e1ef2bc0e8df267a4b093b99f563c9c90.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <9274200e1ef2bc0e8df267a4b093b99f563c9c90.1783749722.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 06:15:18 +0000
Message-Id: <20260711061519.0D85B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Device Tree ABI breakage due to removal of fallback machine-co=
mpatible matching and strict requirement for new DT nodes/properties.
- [High] Double-decrement of sample rate user count when `grab_sample_rate(=
)` fails.
- [High] `relax_sample_rate()` incorrectly excludes hardware's minimum and =
maximum sample rates and permanently erases constraints applied by other co=
mponents.
- [High] Static global `snd_soc_card` structure reuse causes list corruptio=
n on multiple probes and dangling pointer Use-After-Free.
- [High] Calling `mutex_destroy()` synchronously in `.remove` while using d=
evm-based sound card registration creates a Use-After-Free vulnerability.
- [Medium] Missing `mutex_destroy()` on early probe error paths.
- [Low] Unused variable `codec_dai` in `omap3pandora_common_hw_params`.
--

--- Patch [10]: [PATCH 10/16] ASoC: omap3pandora: Rewrite sound card driver=
 as a platform driver with DT ---
commit 8781d4ef4d1eb0b2da4ee910133603e631f2f4a9
Author: Stefan Leichter <sle85276@gmx.de>

ASoC: omap3pandora: Rewrite sound card driver as a platform driver with DT

This change converts the omap3pandora sound card driver to a standard
platform driver matched via Device Tree. It also moves code into the
PCM1773 codec driver and splits capture/playback operations.

> diff --git a/sound/soc/ti/omap3pandora.c b/sound/soc/ti/omap3pandora.c
> index 6c9c184cd9d6f..d3509473f5df0 100644
> --- a/sound/soc/ti/omap3pandora.c
> +++ b/sound/soc/ti/omap3pandora.c

[ ... ]

> -static int omap3pandora_hw_params(struct snd_pcm_substream *substream,
> -	struct snd_pcm_hw_params *params)
> +static int omap3pandora_common_hw_params(struct snd_pcm_substream *subst=
ream,
> +					 struct snd_pcm_hw_params *params)
>  {
>  	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
>  	struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);

[Severity: Low]
Is codec_dai used anywhere in this function now? It looks like the usage
was moved to omap3pandora_capture_hw_params(), leaving this variable unused
and potentially causing build warnings.

[ ... ]

> +static inline void relax_sample_rate(struct snd_pcm_substream *substream)
> +{
> +	const struct snd_interval default_sample_rate_range =3D {
> +		.min =3D substream->runtime->hw.rate_min,
> +		.max =3D substream->runtime->hw.rate_max,
> +		.openmin =3D 1,
> +		.openmax =3D 1,
> +	};
> +
> +	*constrs_interval(&substream->runtime->hw_constraints,
> +			  SNDRV_PCM_HW_PARAM_RATE) =3D
> +		default_sample_rate_range;
> +}

[Severity: High]
Does setting openmin and openmax to 1 permanently exclude the hardware's
exact minimum and maximum supported rates? It seems this would block rates
like exactly 8000 Hz or 96000 Hz from being selected, as these flags make
the interval mathematically open.

Also, does overwriting the hw_constraints interval directly via
pointer assignment permanently erase other constraints that might have
been applied by the CPU DAI or Codec DAI?

[ ... ]

> +static int omap3pandora_playback_hw_params(struct snd_pcm_substream *sub=
stream,
> +					   struct snd_pcm_hw_params *params)
> +{

[ ... ]

> +	if (!ctx->playback_stream) {
> +		ctx->playback_stream =3D substream;
> +		ret =3D grab_sample_rate(ctx, substream, params);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
Could this lead to a double-decrement of the sample rate user count?

If grab_sample_rate() fails due to a sample rate mismatch, it will call
release_sample_rate() and decrement the count. However, since
ctx->playback_stream is assigned before grab_sample_rate(), the ALSA core's
subsequent call to omap3pandora_playback_hw_free() will see
ctx->playback_stream as non-NULL and call release_sample_rate() a second
time.

The same pattern appears in omap3pandora_capture_hw_params(). Should the
stream pointer assignment happen after grab_sample_rate() succeeds, or
should it be cleared in the error path?

[ ... ]

>  /* SoC card */
>  static struct snd_soc_card snd_soc_card_omap3pandora =3D {
> -	.name =3D "omap3pandora",
> -	.owner =3D THIS_MODULE,
> -	.dai_link =3D omap3pandora_dai,
> -	.num_links =3D ARRAY_SIZE(omap3pandora_dai),
> -
> -	.dapm_widgets =3D omap3pandora_dapm_widgets,
> -	.num_dapm_widgets =3D ARRAY_SIZE(omap3pandora_dapm_widgets),
> -	.dapm_routes =3D omap3pandora_map,
> -	.num_dapm_routes =3D ARRAY_SIZE(omap3pandora_map),
> +	.name        =3D "omap3pandora",
> +	.owner       =3D THIS_MODULE,
> +	.dai_link    =3D omap3pandora_dai,
> +	.num_links   =3D ARRAY_SIZE(omap3pandora_dai),
> +	.dapm_widgets     =3D omap3pandora_local_widgets,
> +	.num_dapm_widgets =3D ARRAY_SIZE(omap3pandora_local_widgets),
>  };
> =20
> -static struct platform_device *omap3pandora_snd_device;
> -
> -static int __init omap3pandora_soc_init(void)
> +static int omap3pandora_probe(struct platform_device *pdev)
>  {
>  	int ret;
> +	struct device *dev =3D &pdev->dev;
> +	struct snd_soc_card *card =3D &snd_soc_card_omap3pandora;
> +	struct omap3pandora_sound *ctx;
> =20
> +	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
>  		return -ENOMEM;
> =20
> +	mutex_init(&ctx->sample_rate_lock);
> =20
> +	ctx->amp_gpio =3D devm_gpiod_get(dev, "amp", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->amp_gpio)) {
> +		dev_err(dev, "cannot find amplifier gpio\n");
> +		return PTR_ERR(ctx->amp_gpio);
>  	}
> =20
> +	ctx->amp_regulator =3D devm_regulator_get(dev, "amp");
> +	if (IS_ERR(ctx->amp_regulator)) {
> +		ret =3D PTR_ERR(ctx->amp_regulator);
> +		dev_err(dev, "Failed to request regulator for amplifier power: %d\n", =
ret);
> +		return ret;
>  	}

[Severity: Medium]
Do these early error returns leak the lockdep tracking for the mutex?

Since mutex_init() is called before these checks, shouldn't they use goto
err_mutex instead of returning directly?

[ ... ]

> +	if (dev->of_node) {
> +		ret =3D snd_soc_of_parse_card_name(card, "label");
> +		if (ret)
> +			card->name =3D "omap3pandora";
> +
> +		ret =3D snd_soc_of_parse_audio_simple_widgets(card, "widgets");

[Severity: High]
Does modifying the static global snd_soc_card_omap3pandora structure
in probe() create issues if the driver is unbound and rebound?=20

Functions like snd_soc_of_parse_audio_simple_widgets() allocate memory
with devm_kcalloc() and assign it to the card structure. If unbound, devres
frees the memory, leaving dangling pointers in the static structure.
Furthermore, probing multiple times could corrupt the global linked list
by calling list_add() on the same card->list node twice.

> +		if (ret) {
> +			dev_err(dev, "Failed to parse DAPM widgets: %d\n", ret);
> +			goto err_mutex;
> +		}
> +
> +		ret =3D snd_soc_of_parse_audio_routing(card, "routing");
> +		if (ret) {
> +			dev_err(dev, "Failed to parse audio routing: %d\n", ret);
> +			goto err_mutex;
> +		}
>  	}

[Severity: Critical]
Does this strict property check break compatibility with older Device Trees?

The previous driver automatically instantiated the sound card based on the
root machine compatible string. By unconditionally requiring the new widgets
and routing properties and failing if they are absent, will users booting a
new kernel with an older DT lose audio functionality completely?

> +	snd_soc_card_set_drvdata(card, ctx);
> +
> +	ret =3D devm_snd_soc_register_card(dev, card);
> +	if (ret) {
> +		dev_err(dev, "Failed to register sound card: %d\n", ret);
> +		goto err_mutex;
>  	}
> =20
>  	return 0;
> =20
> +err_mutex:
> +	mutex_destroy(&ctx->sample_rate_lock);
>  	return ret;
>  }
> =20
> -module_init(omap3pandora_soc_init);
> =20
> -static void __exit omap3pandora_soc_exit(void)
> +static void omap3pandora_remove(struct platform_device *pdev)
>  {
> -	regulator_put(omap3pandora_dac_reg);
> -	platform_device_unregister(omap3pandora_snd_device);
> +	struct snd_soc_card *card =3D platform_get_drvdata(pdev);
> +	struct omap3pandora_sound *ctx =3D snd_soc_card_get_drvdata(card);
> +
> +	mutex_destroy(&ctx->sample_rate_lock);
>  }

[Severity: High]
Can destroying the mutex here lead to a use-after-free or lockdep panic?

The sound card is registered using devm_snd_soc_register_card(), which
defers unregistration to the devres cleanup phase. This runs after the
omap3pandora_remove() function returns.

If we call mutex_destroy() synchronously in .remove, does this leave a
window where the sound card is still fully active and exposed to userspace,
but its internal lock has been destroyed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783749722.gi=
t.hns@goldelico.com?part=3D10
