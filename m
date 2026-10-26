Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792980636;
	b=RAQ6SWgQK21hUpeKsx31V5D5zeH5DwC7IyWOo366A5VShwrVajipY51807YMUUxXRk1K
	 3XGPspn8bS8KPd3ivIB/oDoht5dolyils382nMyNhkAsZRd/OkvY0m0tmR7QTm9Tul3SS
	 z2Tj2uZB5N+ACpCqnNcLF/1o+NTJE+T1WBXxJ6eZu4Ff3cH8CTYxl7As+0PO4JHXvj9GJ
	 YaaAQ/WfQQmxyAyZtbTTT4lOWspkFzjoBMiZtvzQruQ1CNyxGx9pz96TI81rfewhDYexR
	 rvmOz9ibGCNH23T9pVag+S1GeCDUIKUE21dgHG8udp40ks1k3Oqg58FMiGpxeBogq6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792980636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PhozeamFwuWtPyIKg2kpa7YRAXXBYhqW3aJ0bO6CqHQ=;
	b=Q8XYJfV6mS/6rxuZES4pM/V1Cx8eHwIlQoZh076RS/A6qebBvfbfu+1OkE1EsPPT8oqa
	 +GXdNeeo1eYLfs5bP6E370aQJ9X3XArDMfILsN8Tk14isPRWar9bky6KZhqWHT8I5aomq
	 FE9zfuDI//pTVz6o7aeqSbYxS6TjlDXSP6ch2snIN9N6t/FsJQU5lhWW99Ju8ddFFpBHv
	 jQDstbFRowkwY02dCaIpXPh1amB1ZkDdtGAoadAwqMs0mp82TYyo2cUQySghDknXty3Az
	 8vu8sGhZL9vnnKVGQGW2DaBFHeY/ZlLheJDO+SYBA37UsRH94GXGfUt7pNA4enI4LiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k6+0IVKn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2114606A31E
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 02:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2114606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k6+0IVKn
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a05effaf8dso1602348b3a.2
        for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 19:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792980635; cv=none;
        d=google.com; s=arc-20260327;
        b=TRmISJo8mbHPFDyKahjWols1VexAgJHaybW58kdA8tbLklU8U5yO43Ppe87Ic6bYkp
         kfq1rMs6vWICKe86trn259yUibOCH7B/YLoQ2irQHs+EwuGLTBdh0Jsi3LiLo9kOpkzL
         qXSCN17M/r/DYpI0yrKSjhHocaCyIHwRk7giEUP9rpR8iJqQ02LgOrPpIIZsSQWMjycK
         oyXOn+bPX60PzNMhTzzjqsBFkiEO/+xUwdIXLIw4fmdNe1fm+rmjS0WbW+2CfOiBT0Wo
         Ngod3f4rTwdwPkzW/PjRqnMpQrZSvNF8ucvowop/Z8O4RQAzSNUpoRBjt/MCIpYFuP/b
         wZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhozeamFwuWtPyIKg2kpa7YRAXXBYhqW3aJ0bO6CqHQ=;
        fh=MwihugnzRODCK3ed71EVtkA2KNW94FMErT7RX/T5hxY=;
        b=Pioi135MonPbiSDnQ6DzwwwtjHnCfleDGgyf7trfiHfqehhrtQUIKuaEOF6kk2c/VQ
         L8f8INWSScLFb2esARp/qze8q7gra/wbNRNOCHLZhCeqFgksvTO860K3pl7pX1QqzWiV
         NtQdfT4zvNh0iP9Q+WkZDj6dERZkSO9zEGuNykvDmd2vrx85VJWhiiI+QeQ57P4i3E6F
         cHBSAQxQINutUVOvHXvNL1CdV9rD82TEvvbk0mTX7Xev1E8lSNQAWJe5w+9iXIcmgBWW
         3Tizg2ml7K6AmYnTuOIcdfdHrE1+pkWxWewcAzGbPYI5yZUsSBzP2VzgYAhNZwQsZeYA
         EeGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792980635; x=1793585435; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhozeamFwuWtPyIKg2kpa7YRAXXBYhqW3aJ0bO6CqHQ=;
        b=k6+0IVKnFqcZTXYaP4pdeiqIra7t+p7uptYDPo2Itvu/nX9pUQCe9/uAMOSpJY9S/V
         uj9uglSGzJHGCNhB2rldXY22tX9Em+aGkOmYwOoax/Fm8UtlKM86n7oM9wqxOcUmGlPI
         dYdXd7fQBKVIgXfYgAMUO5Hw1rixrgJBvhkArYll3i4A+lymnA6aq0lB9KkawSUWE0vp
         ZOaG76Sqt3RBffQSyOnBYcP04LLsroqb9wyic3xt+UxVK/+ZIW4ZN5qRK/LNxZxP+mDI
         w0jmD4li4WYf4nmEtfsT8ru5s2JO0xwZbP5OfsDeSAknZvZL2UV9gobZll1Ee2+VmQMi
         3v4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792980635; x=1793585435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhozeamFwuWtPyIKg2kpa7YRAXXBYhqW3aJ0bO6CqHQ=;
        b=blIehjc/fpCAzeBF/4Je1zKxCkeDE0QCoM6rhjdlIMmqsS41aXZM1ifuOC+KwOVr5D
         ubroEBE9AxnEVR9Ckom6ldT9CJpLbfCFKnL/TWgbKFILHr7CVp0mXdp1g+KyJJFTHtn8
         wD49jU846cjdQjulclNkdcr4CGBENRoWOm3vqNc+4+/2wy+kzr6a+fTSi+bUKCByVoXw
         X+co7ubKg5Ijlb1IT3304RBFNelq7txsuceRxXSKPkL13DjAIiQ7Rw9yV0zGovIAFUmN
         0r5Ou+2BPiYDwk4RwzR+EzJ5FxatKow95CXrebIdMpJIE0WDALhy0bPIYdfnTQG1B7UQ
         6Jhw==
X-Forwarded-Encrypted: i=1; AKwUvBwbiY10Uz/NYwZAeQGQ4stWGBMPUJeogzP7y1H2OUEQ2GIHb+I35GbElKuFcgJpsldlgfA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ3gcR1WSM5BcKHh9iXN6W1Coycxv/3+ogH5CDYcVMHWgc2HZ3y
	TjMXQAMSLo9a0oOpgAXeGNWRaM0Nzm/iH0UNZc0z2kGnGqmfZtwHZ7/kivsQ+zMKr17MtRQr+5f
	hSRsxiE6ouj+wbLmBzXVr3jeoeJAun10=
X-Gm-Gg: AYBFou1TgwNlrzoqT6t0jOfx6GVQQcGmIrJA+IN/Ye68f9sq2W/H9i6dzW+RtXYXK9W
	cZnrdXMcfP7Y8Hr/V7keOMsX5K8Poz5yzUa9BPfw2kenV2sT2BxRpQ+K6C9c6S544ujLF+0wE3a
	aEibP6H/7XcR4maYWG174iLVAxjdQkeqLNKwYHJlfJ2JK1qhm5eZvuCevVYVwBTMPC6ip5quq7k
	Okc978ssTssnEmeR1T9WhvR7Rk3XM8YcFvacPGvbrd8WI6pAi0TlzjPu3Np9whO+pabcKf7fTgy
	YboB/I4iiCvR1kDmQRs7cdHnuVdMVU8Ua52aNNYHakuASlxYV/D4si3JZiPcqJf3d/ivqpyJ8xE
	4ENS0SIstVH2ErU8qsAQ5ytZ6iAFip+C0pTx0VDR2XNNkQrHSrzXY
X-Received: by 2002:a05:6a21:3f92:b0:3e1:a769:9620 with SMTP id
 adf61e73a8af0-3e7cd688935mr3859739637.71.1792980635201; Sun, 25 Oct 2026
 19:10:35 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026003918.155321-6-pmazzini@gmail.com>
 <sashiko-outbox-184583@kernel.org>
In-Reply-To: <sashiko-outbox-184583@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 02:10:24 +0000
X-Gm-Features: AclHuK8r-7Bfel_EEhpHI86UjS9b9Nqlm9UoSS8x6HzK6eJI57dyjtwPozP_C4g
Message-ID: <CAAxh=jvoB5c94U+y3ZQ8ijjPH=kB2DuL_+r1EXXKrSZQq7ojCQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This follows the TPS65185 and FP9931 drivers, which register their
temperature sensor in the same way.

On Mon, Oct 26, 2026 at 1:35=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] regulator: sy7636a: registering hwmon device outside drivers/h=
wmon/
> --
>
> commit 3011502577fb90233215473b5182522faa4b0058
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> regulator: sy7636a: report the temperature
>
> This commit removes the dedicated sy7636a hardware monitoring driver and
> moves temperature reporting into the sy7636a regulator driver, reading th=
e
> thermistor register only when the rails are enabled.
>
> > diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/=
sy7636a-regulator.c
> > index 5705599d1b55e..816df7716c0e0 100644
> > --- a/drivers/regulator/sy7636a-regulator.c
> > +++ b/drivers/regulator/sy7636a-regulator.c
>
> [ ... ]
>
> > @@ -147,6 +148,52 @@ static const struct regulator_desc desc =3D {
> >       .of_match =3D of_match_ptr("vcom"),
> >  };
> >
> > +static int sy7636a_hwmon_read(struct device *dev, enum hwmon_sensor_ty=
pes type,
> > +                           u32 attr, int channel, long *temp)
> > +{
> > +     struct sy7636a_data *data =3D dev_get_drvdata(dev);
> > +     unsigned int mode, val;
> > +     int ret;
> > +
> > +     ret =3D regmap_read(data->regmap, SY7636A_REG_OPERATION_MODE_CRL,=
 &mode);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* the thermistor is only sampled while the rails are on */
> > +     if (!(mode & SY7636A_OPERATION_MODE_CRL_ONOFF))
> > +             return -ENODATA;
> > +
> > +     ret =3D regmap_read(data->regmap, SY7636A_REG_TERMISTOR_READOUT, =
&val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     *temp =3D (s8)val * 1000;
> > +
> > +     return 0;
> > +}
>
> [ ... ]
>
> > @@ -235,6 +282,15 @@ static int sy7636a_regulator_probe(struct platform=
_device *pdev)
> >               return PTR_ERR(rdev);
> >       }
> >
> > +     if (IS_REACHABLE(CONFIG_HWMON)) {
> > +             struct device *hwmon_dev;
> > +
> > +             hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev-=
>dev, "sy7636a", data,
> > +                                                              &sy7636a=
_hwmon_chip_info, NULL);
> > +             if (IS_ERR(hwmon_dev))
> > +                     dev_notice(&pdev->dev, "failed to register hwmon\=
n");
> > +     }
>
> [Severity: Medium]
> Should the hardware monitoring driver remain in drivers/hwmon/ rather tha=
n
> calling devm_hwmon_device_register_with_info() directly from
> sy7636a_regulator_probe() in drivers/regulator/sy7636a-regulator.c?
>
> Hardware monitoring drivers are expected to reside in drivers/hwmon/, and
> when a chip's primary functionality is in another subsystem, its hardware
> monitoring support should be implemented as an auxiliary or subdevice dri=
ver
> in drivers/hwmon/ rather than registering a hwmon device directly from
> outside drivers/hwmon/.
>
> While the follow-up commit ("regulator: sy7636a: bind to the i2c device
> directly") removes the mfd cell table in drivers/mfd/simple-mfd-i2c.c,
> sy7636a_hwmon_read() only accesses the shared regmap via regmap_read() an=
d
> does not depend on internal regulator driver state. Could the temperature
> reading check be kept in drivers/hwmon/sy7636a-hwmon.c (for instance via =
an
> auxiliary device registered by the regulator driver)?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026003918.15=
5321-1-pmazzini@gmail.com?part=3D5
