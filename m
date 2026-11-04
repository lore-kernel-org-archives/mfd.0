Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815622;
	b=z36rFopZDe2llvfgTTEnRPwIC9ranlZYN+kZoH/bAaJEzGDofSCHYD7gcdzAMDKahUM4
	 wjrhzYdDSw9df0bBlGLKS2kkq+UltyXI1kCl9hRXnmnPpry4s+FgNnJWoGmrDNlgF8tNh
	 /5U6vxm+l7PM3GJh94bXDoT4AmXS+EbFAjqkPqK+OdBPbEVpk9QvqFHyoMHi6G2Z29TE1
	 /Iheb/otaMYkxoDADdo2PhxbSKokCSUketf2Mc7n4e5sfNS9FpIEYHE3Gs5h1Vnx1dRio
	 SPp95DnbA9IpRHSENDdPSDwPf2bSuiDmTk/v8BgnfE3VVH6V/YNOPWEt39yg8SUizow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cpSxAIXjkgvOZWEoUA1N4M2CNF30qSUuc06GCCZYA9g=;
	b=1U6Hli3ATsBEHJ7jdqLELdjE4PyyQm3rpFja6sryJDEjfGSsMhaXGPYSjmhg8+FjFVd9
	 jni0RIRg4T2LFhEQBymnpmvrg34CrojjrQkXX3DJh5tn6P35/owZ80Rms28OrS9YgvxgM
	 xJQfxsYDuBBv8MfL5xZ4EyCMuD9rczCWhwA+SXo0ZgGp3M+67iDcfFF0MNZjIjsbkWV+R
	 UBcSWqx3jd3KX6vQcSlDVizIZX+zZgo4Qnrt32yld2fB7CqGA0XH4w/Okkk+bpY8kLwcu
	 JpF8AyjCyFp6GTsZLI7gQzqKm9tajcL+1ekAJLUHTG+0+xHR9xZBKYCgRZkfyaWQ2AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgPcBU7t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DFD606EEBD
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 18:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6DFD606EEBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgPcBU7t
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36cad25b8b0so1486050eec.1
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 10:07:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793815621; cv=none;
        d=google.com; s=arc-20260327;
        b=qKP9ZNwWm1bQ/FkaPvpk+XDdcXufh041dhCOYUZvEM3PAHOLg2QbRCXJTtfCiT4KTj
         aafyzYMbaNnil9EXzAwNUyYPoK4fgdu/BLrqd1xpaAYQUzuX6Ei/pJAYul+1ncvL3x8S
         fyXQGyotwKifgQbCCvRtR6nu5OB+CCPY8aTgRyCtUYh3xw1A3VcdpowVs4CPJlJb3UCJ
         QKzqXoMvJXys9idNPqBo35EaUOZsSyYm/5guioEKLgl3w7BBLYar1f7ZTcTEcTcaoNkC
         gBLBToqKonzytLDKwBR7EK2bOg9/zvA7MO01IP5Z/+/aGXPEaRTscnIWr8re7Ksc8qjM
         fj7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpSxAIXjkgvOZWEoUA1N4M2CNF30qSUuc06GCCZYA9g=;
        fh=p/YtKlPnlGvFetbQbEaP/E/5VQGYt+ndaJnBGeV2b24=;
        b=Y5eIcA/MvqcuwBEwun72GZNi4DsiErIDM4MD/OklhqpR0ZfcD9NVGlwseEOtMa6e7Q
         +lWggvnfVBWhjQEdyUu+4wCvJGPlACHBxyOTdfLySNLRRRZYYBJJ3hd0jPVfTkD4xO0r
         VKBxcrhdnoF+2aUwwxuQ/z8MtBVx9w3TpGhrzDcnvdZ+LNbWUtjdIjxTutnko+ohT/hF
         Fz1PYCOgvT4o4fLykQGp6esNRUAeEOw/jeOWsJ64sGJKvFTfJfHKh5uxDtsQRTAF2PEo
         COKShexbTFclv7QANLr1q3G3wozTYNJsK9ONj3wOJzj+7dMC1oAexfglNkWQxTmlWDfx
         vRlA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815621; x=1794420421; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpSxAIXjkgvOZWEoUA1N4M2CNF30qSUuc06GCCZYA9g=;
        b=mgPcBU7tWAz3uQrFOVp/FZ0ySbSKapb6kRRzhfSuTscXH+vd3NUIpj5EQOFiZGMZcB
         0x/NP/9LoZy4x98dZBHJ16pvBj1hM++Pve4k3xgmLoKsBL9S7qW+Cp/Q3tsOjVc4tH/X
         y3Ru7i82ISv/4v1SBvei0aUwzQHj4d4wtdfmscvo6Q+62ewl6wD34XT+co8gbSJYOGuz
         bgEFAKa5u3hEjqSgGUs/hgLAT7Nb8VZxfG3VxTKnp04QCahpXBlZ/jtPB9KhziGUTKwq
         hW18E6mB4Mehb13ZqpQvqCLihNa2DhZNJ74tn5Cwe6djeaT9ccbLy5hXpKWK3ysC5GbG
         iVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815621; x=1794420421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpSxAIXjkgvOZWEoUA1N4M2CNF30qSUuc06GCCZYA9g=;
        b=Nx9PWVG97T+RHO4ByqqwmQZifyA4QQMLGuJNet3JmTBuFUb711/22JrAEIKi57N2zv
         /8Bhf1NmLtUWFkGvkXnwXAAZIOijGVTZgrNWSUvk5ADd6lnlc/0fVb0zJQLphTCfziQf
         SKGGLqhlc7NbWTt6Wci4mdteNJyPa4Pxy0rlCeJS1Km2ixahTVFBpfLq0x+nu4+1tEE5
         458s0aVW63vaEYdHJSRNrXrkvpXgfkQ8hvruyjvMgoUQS7B1oTcIXkwR5AHHVfENSgQb
         YwFnHAsWXpQmsWDtbX20F/FV5wUA14lOGeEmd+mw7HQcTqy6clQdHRAH2db55Xatm8z3
         CI8w==
X-Forwarded-Encrypted: i=1; AKwUvBw6U4jEjbIY2HOzWwA5M3Ow176Ztq14pjfuRKUXN1KGSaDc8646xL+mU6Fi50IFziMTHKo=@lists.linux.dev
X-Gm-Message-State: APuU4Z/zBJeQKNsmmRanF8/dsixcvwRTqA5FhQbewk1IchNvc0MsIakV
	PP+pff1brASubIGmM7S18Pfj3zqBfjk84ocZB9azhIt9BuJv/jzHJMJjk8uR7trZjV1vF2iCdo7
	pxhQapYNttnB/gfwiGdJ/RZD7KbcAbj4=
X-Gm-Gg: AYBFou02+MC5u6l0jbf0oL29I1pc13dsFrRbWqy43c6YgN00aAxQuI1FGmEy3UG4ngL
	VYK+WTNjoJOQi7lcDqoVyn/J0zVgST+d0Iby2mDnyRuUMtLg6mRHD2mD0fxfw2zyZAi9HA9U82R
	8k+nLpHDXu0myRNUghYeqJZsCZfrOloc/7XcC0EGWPvT3ZFopeRIazsp0UQqmujTFeU9l8BRT0M
	2wfyUMS6lQtCYydOJtsPTq0w19iDnRvamUfqVhqSz5zxtrC7/0f4WqRB6qPR8XBadWpcUhK2iQh
	4PkyjZVTSliDVTamsHFHAJ4IRYVP3hRUK2NI7DiAKUn+TRGP8HN3JIgtPGbxhqNhxxt1+/vnL+p
	SgUBnbA7Rxx9ysp2vjSdFE7mIo+wsoSu0HWpDszcscS/cM2mzVvB2EsCRrYxpcvwUoPZoGA==
X-Received: by 2002:a05:693c:4153:20b0:358:8f02:e0ca with SMTP id
 5a478bee46e88-36a4236903fmr25768336eec.9.1793815620547; Wed, 04 Nov 2026
 10:07:00 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027114634.79706-1-clamor95@gmail.com> <20261027114634.79706-5-clamor95@gmail.com>
 <sashiko-outbox-186485@kernel.org> <20261104175537.GD1650678@google.com>
In-Reply-To: <20261104175537.GD1650678@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 4 Nov 2026 20:06:48 +0200
X-Gm-Features: AclHuK-dTrm5_ju5-WTFNvPOfO0V7jPIoIavoQPE4CCcI-4nnKW3q4poZzZ3CXo
Message-ID: <CAPVz0n19Ax1LBcD1XrnCHZmB=dRT419ggybrKCJjeXRUC_VnZQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] mfd: max8907: Convert to use device managed
 poweroff handler
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 4 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:55=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 27 Oct 2026, sashiko-bot@kernel.org wrote:
>
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] mfd: max8907: max8907_i2c_probe() drops maxim,system-power-con=
troller check
>
> Did this get an answer?
>

There are no in kernel users of this property and pmic in general, and
iirc never were. Pmic was designed for Nvidia Tegra devices. I have a
few devices with this pmic and I am planning to upstarem them so
driver is not abandoned. Obviously system-power-controller will be
used in those new trees. The maxim,system-power-controller check can
be dropped I suppose.

> > commit 5deb6448298f2829c11e1c8af86067bd08a79d7f
> > Author: Svyatoslav Ryhel <clamor95@gmail.com>
> >
> > mfd: max8907: Convert to use device managed poweroff handler
> >
> > This commit replaces the global pm_power_off assignment in the max8907
> > MFD driver with devm_register_power_off_handler().
> >
> > > diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> > > index 2a38e00a10c3b..e282dd82ece69 100644
> > > --- a/drivers/mfd/max8907.c
> > > +++ b/drivers/mfd/max8907.c
> >
> > [ ... ]
> >
> > > @@ -185,8 +192,6 @@ static int max8907_i2c_probe(struct i2c_client *i=
2c)
> > >     struct device *dev =3D &i2c->dev;
> > >     struct max8907 *max8907;
> > >     int ret;
> > > -   bool pm_off =3D of_property_read_bool(dev->of_node,
> > > -                                   "maxim,system-power-controller");
> > >
> > >     max8907 =3D devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
> > >     if (!max8907)
> > > @@ -237,9 +242,10 @@ static int max8907_i2c_probe(struct i2c_client *=
i2c)
> > >     if (ret)
> > >             return dev_err_probe(dev, ret, "Failed to add MFD devices=
\n");
> > >
> > > -   if (pm_off && !pm_power_off) {
> > > -           max8907_pm_off =3D max8907;
> > > -           pm_power_off =3D max8907_power_off;
> > > +   if (of_device_is_system_power_controller(dev->of_node)) {
> > > +           ret =3D devm_register_power_off_handler(dev, max8907_powe=
r_off, max8907);
> > > +           if (ret)
> > > +                   return dev_err_probe(dev, ret, "failed to registe=
r power-off handler\n");
> > >     }
> >
> > [Severity: High]
> > Does replacing the maxim,system-power-controller property check with on=
ly
> > of_device_is_system_power_controller() break system power-off on existi=
ng
> > DTBs?
> >
> > In include/linux/of.h, of_device_is_system_power_controller() only chec=
ks
> > for the unprefixed property:
> >
> > static inline bool of_device_is_system_power_controller(const struct de=
vice_node *np)
> > {
> >       return of_property_read_bool(np, "system-power-controller");
> > }
> >
> > In Documentation/devicetree/bindings/regulator/maxim,max8907.yaml (adde=
d in
> > commit c254fcc966ae), maxim,system-power-controller is still documented=
 as a
> > deprecated property for backward compatibility alongside
> > system-power-controller:
> >
> >   maxim,system-power-controller:
> >     type: boolean
> >     deprecated: true
> >     description:
> >       Telling whether or not this PMIC is controlling the system power.
> >
> >   system-power-controller: true
> >
> > Should max8907_i2c_probe() check both
> > of_device_is_system_power_controller(dev->of_node) and
> > of_property_read_bool(dev->of_node, "maxim,system-power-controller") so
> > existing DTBs using the vendor-prefixed property continue to register t=
he
> > power-off handler?
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027114634.=
79706-1-clamor95@gmail.com?part=3D4
>
> --
> Lee Jones
