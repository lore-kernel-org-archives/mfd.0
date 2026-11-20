Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795187701;
	b=jOAxJyncQb1pK7rDZ9zaf4h7cYStDu/DTrc1zKgmQWOeqHGi1AtylwBrHUCQgqc4Fja7
	 Q6TgD81qg7L/BVWkeThKFM9nu2Q2KM6f/mkgE/gGicGDSkVeixUa1e+u9gBMmqDfvUW/B
	 uQxx/sOuCmBjAcOhwRICVOGiyZr0ovqsKyhsSGzUVDBnZGttE0qp3Z2A27ryT8aRuNZFT
	 U5rxPNRCvmH/H//lCksFsELBjL+8AzbcjV/6qNamjsywdFW5d+gfk3uUINFTJigMguj5f
	 heUaJwMRuhbx7ow9rfE3JxUmK+o4wi8d4cpZJ9zudvYPCGdZRg2OW9Bew5DaISW1Isg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BTVg64Op0q6C9ndfjZSeyDDbPDPodfwIL2/3SvvfmEM=;
	b=ldCL7T2O1AhQ94rwBy0eV+0yQsSdA/SWS5oDyS3D6zvEYCmawFROjh1QC/xe/NsaB3bz
	 siDtck6PUWCpk5ekq7dFUTZCUeYWya/8/e4e12XHLCobwCLyF17VDEfPsqnumU34lIioy
	 MPzrqmAmbRhFS3JT5QH1fk+i+GWn7kOlAyJpYdlK4/IN2NRVO4d71bv63K7vF2DNkgRAs
	 8jM1VGITDFhH8A0y4DQxaqW37qbl+drvfRWrd1HBwaYUNX5toTtpYuWqU3vOSWungHeot
	 W+vhJfTFikfTw+Ha7sFejgyd/Ca35sTKuUTVbxmM9q/0RYKCqjO82zAg8gbSPmo/6ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lcau7FYd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C185E606A33C
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 15:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C185E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lcau7FYd
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-372bdb942dbso1362856eec.1
        for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 07:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795187700; cv=none;
        d=google.com; s=arc-20260327;
        b=V0nm5S4hlifFS0AkSAx3DO56E9ZLIn0nBx1xu8fgPbREOdkkXyilzUq+AY7fWQKDTb
         s6q4BG+SDVYKFJ6XEnMd/r7hgp2e5dVLySTkDaIRDa890qldDbwWdW5OhLF52YeRqbbP
         uXmH6j/v/lrS6ok49u3wEtaEeCJplrorAZ1CcwbuqtUdVt36lNf/ASv/arau/EzP0Kpe
         9MpDvuGn3Z3YVAyOOSrscH+P2gh/6xE22hyfCiZ17pu7n0QQqVLUye4obp3c+88ZIE1T
         IZt0c++QV/EmwpQdykRC+xxS42q3EJr2dzXRt4J21jBWrikfVAHKQNFbVUqB1kUuHZFZ
         n0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BTVg64Op0q6C9ndfjZSeyDDbPDPodfwIL2/3SvvfmEM=;
        fh=uO1kAN7pMI05p9y6CsCDOKd/aG/yCxsOJlB5nn3iu+g=;
        b=kwf8PTGvvz3VAQAl6f1TIrwU52lpTtU6PyXUg29iR7FfIeN4IzKcOZONkPfMTPDLd9
         QsTshSI3/yIvxqL7aSNOjp5Nke/igKgNGMPs5vdHdgfJBos8xAqn1u78PbAF2op0PY5v
         Z7bOqvtV0JgKnz7wJVz6aEXKfrDfEl/JVUltzVnuSjHVbJ6iuNMEGE0lCx3IKzLyMet5
         17tYRsafEkjC8x0ts1mt8EcPbqlURfGdjSTB364f1cmOnd0fH0hwHXyPqzsvaia9nITG
         aQl95vOAw7evhIw1QQazdeG7vXdTR4ztI/jpcSFxohMesjv2Ip341zpvXLMrBaUYe18c
         cT3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795187700; x=1795792500; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTVg64Op0q6C9ndfjZSeyDDbPDPodfwIL2/3SvvfmEM=;
        b=Lcau7FYd2rHL/qWMumsWDuqB9MyKRQvaiadlrNo2nItlp+U+FdJhhmlRzCWvJSHbIX
         R9F9bW+xLy7h+yg6RifaW4jn+d73DlzXsajMsLCmM0pg3EoyeRCV41PLjTeqea/Zs/gz
         25zua9V6YC5zN87lkrwQA0igiyv1zhEOWXvKQdTWwEyDIkOPc7atdWX/+PzJTfqv6AV7
         HTr72RNAh2f6bYyi/CystJ7cjFVhpoHDYxqc5JLGa06DvvQc7a/dm2ktm8P4xDyVzU97
         +sVoBwYiEdrkOKxIlU9XztMXhtK74IMAn4qlDu7t9Km5d8C0/Z1KrwOuY/h+1dwzFOBL
         z/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187700; x=1795792500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTVg64Op0q6C9ndfjZSeyDDbPDPodfwIL2/3SvvfmEM=;
        b=DHy9wzYxPSEFix0ah7hZj0IqWqljkY1l8tkSEKGkYmkfmci0BAGMjlVnUYPxgmCTNe
         vUdg5bpYlyN3zeUfP1OloJeek+XFA9LYugHS9Q3MwwkS9xMCT73KhebdvF3+DMhhUoCP
         kslPblW4IG5ylOFOu4/6qDfiTv/1J7lHzrC5uG1sCwb3Amwl+Bt25EuqNAyUDXzgzRmh
         crtNCzRsOIMbDHU/48gs/b7fsRDFe+s7gOjfqmINLgKhhm31+Qetu2UbdiqsqIakll/S
         JQet3NlGApH38O6b4XQjbmto4hUccYAzzN47Geuyzp1cH2zrRMQ+szFouWRQf2hgmWUU
         2cug==
X-Forwarded-Encrypted: i=1; AL+hErHUsZU58RgUdtE/bAuYeHdFpIgV+7usUfwPlJIg+fqMzmluPeDXL7TUncmDKbS8hsGjAfQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/CoJs5EHniZDB9mwop8oB9kNM7dKruukxqcq5fGsfBK31Dq6VD
	eNuK7VLtTNtj8W0EgGsh2GCQ7KiUjHkbaukkZWzBqgDmkS7+vjabkbYfjyekded87Rq5F1QbAEh
	hTGibzWrzYcw5PSzoIQ7mcTdZQmcUCDk=
X-Gm-Gg: AZFdTZfBj7j+OEgLCqG6QQOAdutPPukSrY0pDvmW1+i110ew36/NZUm9YR17Jd26oy9
	X+yR7EhyEZHspbFVVWicj7IquHR1q5zZbTlrDh4FKUR/rshAyC4Jja5iXxlYACh2EsmXMmXpxJa
	P8fg4Q2Oz7kMHAjMI537SBO9MYV9wazWg/TtHb9NAi1iECf4Rnq5csp3mgcDx2QjqLwkcbjTtBQ
	ddlH6NoeKpu3I1cCJK1AScpJ4mCBxm22KfYF3W/5ALYacKQLInpdVvYwvCnsCnjUsFMcGYV2yYM
	Xx/+cfiFPM67x9B8YowXlC2rYSSMPQjv+iajuprIbVsht+qYzPRHSUkocEl3DCsOkasYRiyxZ4U
	mi69G75fAXxJImDsnAg1AMN7St+OJqkccZMZziW8VQdZCr1HjhLFBCNIyhgAJiy0MZP7h7ZEux8
	TG+c4WZZI1OrkXTfCzboU8m8ZAdPW5vJ6LK3T/P7WkBbAwhT2FXPA=
X-Received: by 2002:a05:693c:4091:b0:384:483f:2ea0 with SMTP id
 5a478bee46e88-3856f65af07mr3934775eec.17.1795187699638; Fri, 20 Nov 2026
 07:14:59 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1795095742.git.geert+renesas@glider.be> <CAPVz0n1+qXrO5P+rOBKOSOE86+WcmjNF0taWDZoWqerKrjVgJQ@mail.gmail.com>
 <CAMuHMdWPvKop0KAg_nff29ZeAELKprfmDtp8hDU2KPvJH5VVMQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWPvKop0KAg_nff29ZeAELKprfmDtp8hDU2KPvJH5VVMQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 20 Nov 2026 17:14:48 +0200
X-Gm-Features: Aa3M54q53xAAi2-NE6j4-zP1TXb277cEgD_-5pZDZArGHR0nuFBgm3EHI75NcY8
Message-ID: <CAPVz0n3zsUixggHgKNzWsxtxDZ20GecHGa7qQf2RmzkoJ792KA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Improve MFD_ASUS_TRANSFORMER_EC dependencies
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Lee Jones <lee@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:4=
5 Geert Uytterhoeven <geert@linux-m68k.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyastoslav,
>
> On Thu, 19 Nov 2026 at 15:51, Svyatoslav Ryhel <clamor95@gmail.com> wrote=
:
> > =D1=87=D1=82, 19 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
15:52 Geert Uytterhoeven <geert+renesas@glider.be> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > This patch series improves dependencies for the MFD_ASUS_TRANSFORMER_=
EC
> > > MFD driver and its various subdrivers:
> > >   - The first patch adds a missing dependency for the MFD driver,
> > >   - The other patches enable compile-testing for the input, serio, an=
d
> > >     battery subdrivers.
> > >
> > > Note that compile-testing cannot be enabled for the LED and charger
> > > subdrivers, as they have a hard dependency on the MFD driver.
> > >
> > > Thanks for your comments!
> > >
> > > Geert Uytterhoeven (4):
> > >   mfd: MFD_ASUS_TRANSFORMER_EC should depend on ARCH_TEGRA
> >
> > Though this EC is designed for Tegra based devices, it does not have
> > any Tegra specific parts. It can be used by any other SoC.
>
> Sure, the dependency can be extended once the hardware appears in
> devices with other SoCs.  The question to ask is: does it make sense to
> ask about this driver when configuring a kernel for e.g PA-RISC or S390?
>

Restricting this device to Tegra, even though it is not part of the
Tegra SoC or Tegra-specific, seems plain wrong. If you want to
restrict it by architecture, restrict it to arm/arm64 instead. Your
logic is strange.

> > >   input: keyboard: Enable compile-testing for
> > >     KEYBOARD_ASUS_TRANSFORMER_EC
> > >   input: serio: Enable compile-testing for SERIO_ASUS_TRANSFORMER_EC
> > >   power: supply: Enable compile-testing for BATTERY_ASUS_TRANSFORMER_=
EC
>
> As pointed out by Sashiko, I forgot to take into account the transitive
> dependency on I2C, so there will be a v2.
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
