Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C3B44E66F;
	Thu, 17 Sep 2026 23:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686218; cv=none; b=pwQbC6HumjnT5PKfoZ8Mfn9FINpHYaH9Gz7qe8BLCrJMybkjw5CLz/iP9nUfsQLr1enUz/EGiAizxjhr26RN2Tfqpc02QBYVVaKN/dHs5rapzR/Stl2bRFv3svN66BWtthSa5L1Qm9kxIsflj3Xv2zc9TInI8UwXOKedu/1E/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686218; c=relaxed/simple;
	bh=OzzRBbvB7/oz4atmfrfpVLHzIFWCBoNTHYCRq7+XE4k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uGQgvTEn3saqgphlCo9PhfH0/wgAoNnTe0W6/kQNtb3laf05WP/qg1BqcsEsczGOSCo5VcK2fPUziE0Mx2OrkRRQvy/50nuVuSHrQG7w2CWAP2HXpoMGI7+R1BKHsW7jpZ1GCcIR5LV9FsrR3gyOl51ZOHnrnGkT9kCi5blbQ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyabxKok; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyabxKok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC95C1F000FF;
	Thu, 17 Sep 2026 23:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686210;
	bh=padsMz4O0oX5xAreF3bhZHM8P4eo9wGvOpKJIUWfABY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jyabxKokC4apvVW1MfPbqJZ7aVgoNdfClXLWIFQhUJv0nY+7BtsvYaEFcJ/ggYWxx
	 aWi3HIQklL21KQwwy8MxeYeDL486r3eJdVoB2860LOHn6wZZ3HdhxOaS5iWx0Myxqq
	 JncI/2Ja39GWdX7c2JgFZerMvWdETIrUPcjYkKkpUNYHYS/Cdvyv2buukHx66pDsZY
	 Ohunsf7JW9yAA7psHUpWZ+5MmhtMpZJQbaeu+t/h2hHjR/dWbU90R8Dj4KKFztUCZi
	 V8wehpuc18g27tu0tuzewuihh4ItRKugel2y/doyzaO4ffMv/oeF44ZMhWSuOuqnHl
	 XxgVurmBQ6Kow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/9] ASoC: ux500: Remove the MOP500 machine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260918-ux500-simple-sound-v2-5-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-5-88d29416e3c3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:03:29 +0000
Message-Id: <20260917230329.BC95C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] ALSA: devicetree ABI breakage due to removal of stericsson,snd-soc=
-mop500
- [High] ALSA: ux500: mono streams fail with -EINVAL due to rigid static TD=
M slot masks
- [Medium] ALSA: silent loss of audio on kernel upgrade due to missing SND_=
AUDIO_GRAPH_CARD2 selection
- [Medium] ALSA: ux500: loss of cross-DAI synchronization allows conflictin=
g hardware parameters
--

commit 310750ed2beb07b175f87e9079b77587ed249ddd
Author: Linus Walleij <linusw@kernel.org>

ASoC: ux500: Remove the MOP500 machine driver

This patch removes the MOP500 machine driver and its obsolete binding, repl=
acing
it with audio-graph-card2. It updates the ux500 ASoC Kconfig to directly se=
lect
the codec, MSP, and DMA platform components previously selected by the mach=
ine
driver.

> diff --git a/sound/soc/ux500/Kconfig b/sound/soc/ux500/Kconfig
> index 1130580603500..f3c7c216267c0 100644
> --- a/sound/soc/ux500/Kconfig
> +++ b/sound/soc/ux500/Kconfig
> @@ -6,28 +6,19 @@ menuconfig SND_SOC_UX500
>  	tristate "Ux500"
>  	depends on SND_SOC
>  	depends on MFD_DB8500_PRCMU
> +	depends on AB8500_CORE && AB8500_GPADC
> +	select SND_SOC_AB8500_CODEC
> +	select SND_SOC_UX500_PLAT_MSP_I2S
> +	select SND_SOC_UX500_PLAT_DMA

[Severity: Medium]
Will this lead to a silent loss of audio on kernel upgrade?

When upgrading a kernel config where CONFIG_SND_SOC_UX500_MACH_MOP500 was s=
et,
the old config is dropped. Since the required replacement
CONFIG_SND_AUDIO_GRAPH_CARD2 is neither selected nor implied by SND_SOC_UX5=
00,
users upgrading their kernel using make oldconfig might lose audio support.

[ ... ]

> diff --git a/sound/soc/ux500/mop500.c b/sound/soc/ux500/mop500.c
> deleted file mode 100644
> index 6d196b4b88027..0000000000000
> --- a/sound/soc/ux500/mop500.c
> +++ /dev/null
[ ... ]
> -static const struct of_device_id snd_soc_mop500_match[] =3D {
> -	{ .compatible =3D "stericsson,snd-soc-mop500", },
> -	{},
> -};

[Severity: High]
Does removing this compatible string break devicetree backward compatibilit=
y?

Without a backward-compatibility binding provided in the generic driver, au=
dio
will fail to probe on systems booting with existing or older devicetrees th=
at
contain the stericsson,snd-soc-mop500 compatible string.

[ ... ]

> diff --git a/sound/soc/ux500/mop500_ab8500.c b/sound/soc/ux500/mop500_ab8=
500.c
> deleted file mode 100644
> index feb683c55d113..0000000000000
> --- a/sound/soc/ux500/mop500_ab8500.c
> +++ /dev/null
[ ... ]
> -static int mop500_ab8500_hw_params(struct snd_pcm_substream *substream,
> -			struct snd_pcm_hw_params *params)
> -{
[ ... ]
> -	/* Ensure configuration consistency between DAIs */
> -	scoped_guard(mutex, &mop500_ab8500_params_lock) {
> -		if (mop500_ab8500_usage) {
> -			if (mop500_ab8500_rate !=3D params_rate(params) ||
> -			    mop500_ab8500_channels !=3D params_channels(params)) {
> -				return -EBUSY;
> -			}
> -		} else {
> -			mop500_ab8500_rate =3D params_rate(params);
> -			mop500_ab8500_channels =3D params_channels(params);
> -		}
> -		__set_bit(cpu_dai->id, &mop500_ab8500_usage);
> -	}

[Severity: Medium]
Will the removal of these consistency checks allow conflicting hardware
parameters?

When two applications open concurrent streams on the separate DAIs exposed =
by
the AB8500 codec, requesting different sample rates or channel counts, the
hardware might receive conflicting configuration requests. Since this lock =
is
removed and neither the generic audio-graph-card2 nor the codec driver
enforces cross-DAI consistency, can this cause synchronization regressions?

[ ... ]
> -	is_playback =3D (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK);
> -	switch (channels) {
> -	case 1:
> -		slots =3D 16;
> -		tx_slots =3D (is_playback) ? TX_SLOT_MONO : 0;
> -		rx_slots =3D (is_playback) ? 0 : RX_SLOT_MONO;
> -		break;
> -	case 2:

[Severity: High]
Does removing this dynamic TDM slot configuration cause mono streams to fai=
l?

Without this dynamic update, the CPU DAI falls back to enforcing the static
devicetree mask. The ALSA core will call ux500_msp_dai_hw_params(), which
validates the channel count against the static TDM mask.=20

Because the devicetree statically sets a stereo TDM mask (slots_active =3D =
2),
a mono playback request evaluates params_channels() !=3D slots_active as tr=
ue
and returns -EINVAL. Can this prevent users or applications from requesting
mono playback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-ux500-simp=
le-sound-v2-0-88d29416e3c3@kernel.org?part=3D5
