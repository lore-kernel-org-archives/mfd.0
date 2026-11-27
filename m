Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795791652;
	b=31NZ5Lx8yqbB7jWypmII3DvtYOqr8lYG59FNV5/XHq6fRI3SUlR8AlxvjOhgflpjKS05
	 T7GVKvxlF/mVP7cgde5Ry0FOMr6j9FCe0zNvxIbAXM2BKpszdiRyyn0pqy/bdBN08pNY9
	 5WV7+5mZPEYAvpMXLzSgIRlqsofZexnRWNB/rhr8BnK6gLCgwMb8dKigzH2/CgB+FF5h9
	 8ft47TOQaAWof6LtaRPjBVnT8dz1s703dIqVXNkzvWeA4pFNUwh0ovTEYrFq8JYHRylA4
	 eYjfNZWy748oOVaU3RZjqAKOTMxWtZEvX5ADJnBvjZeOqgWexYeuYxeFzmwfgud69Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
	b=CZ7hcO8nd+pNQptAxjEMILvj9tvEt4La/21dx+2ZEmeXjFVnBRH5Zx5pOt0Spw84BW+v
	 VYmj7pIo4atrH7CoE9Os8RmfgErp457SItUHgZuqTFLqxuww5RUsIVAQ32z7vLxhbNRSJ
	 3PMi4LTFK5bSX7GGgWsbYPHwwfbjVj4LN9CRepQg21Dpi4cNl3+WVlaTBXVlVAhMJiix0
	 1R4UpwxKgt083Qk8hLREHVRcFBBeZ/lfRGnhmkyVQBo+YxlmbXctlXVE3SIGE/MP3bFcN
	 tkk/0t5Q6exsqCve2qnqIa5bD/FtdLKIDhoUfEEy6+ibBUCv6uxqYFkKeEH14rhcpjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgl9jxNV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F08606A31E
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 15:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F08606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgl9jxNV
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b546061d58so19016009c88.1
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 07:00:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795791651; cv=none;
        d=google.com; s=arc-20260327;
        b=YlHnXaiBBy7s4JU1NLGmIdENO0p5T00RTF1G7frJ9BXxcZ1ns7DDJ5fSfe93ThJrzq
         h+x3BwxY8t7ZGT5g2voXIsda+Ntv/drzvPipjwTrsvOeYLkEC1SigzZQlpvOI+ZTE5ze
         La/0oBs1WbJJciRJMFAPiWqLotwbhdGLlYryT9COkyZOz+N1nck5sRY/cEWjX0pDW2ph
         Gp6NdzxafQC84I1tbhmZfqhVBZwQOePapW/UHtzaz6ht0W8kMOLaIc2mQ2oY3mN/qikf
         TPjMj7Otrlj/NnG0y1eW4qsu1RGnijkywA4pPXcw1ahqciTarfs8cDe7TOA0P90DnL5/
         o9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
        fh=SFKNiyQXFotYLvWn5psTm1aAqmQsAbVsmMe49r8jyZY=;
        b=lfLkGMohg9y0fQYQIDUnlyTUtul4bWrQOkDaTxdPUOE3Mwg0ZtCI/aFEjJfFSAil6V
         EpwbvydljIMAzBvBfjsgsykzgZ0Ohw/rTQ2LcYN2oDcvU+O8C91na7Ys4o8yK3d0Tnz6
         hpRhf/L5eBrAjnG5dZqo1bq6tL9BDENCQ5GD7qi17QmMHYhzGwfigP3yGl5KFSfg9qN3
         aIZ4zeYMThf7F2DE/dVbBHhHlV4pZgXHksQvfUcGgVMXa0gY056niIzRWuYvgUfY/GQo
         Dc7NhQYwSn0ZLRNkB3HF9o+3M8juUGOKFDhcsyD5l+PFb6W0ju+lwaA7Krpj7L61F59c
         5hwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795791651; x=1796396451; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
        b=tgl9jxNVkcvPa1VACCIdu3eBiYv23UPbByo6R3b4FPPTmaOhnXoEF2bI34PD2CMfvR
         ZwU5w0Sb6CYf0YSanDOZeDaRwjBj6GsRfRx3wioWhUUYaUAM4t0bIcTwTWzLp9Retmew
         TKvyrxQsaKhqb1/FKVk1OZU5OfblJ4hbleslA9IWvRK0Sa1ZwcIOQdqKlNgQu1TwJs9a
         bsr00gitL01oV3PhWVSNbzAXEbGWlk2qZj3/pvLtpVvWhVTMLwqmPTYOseDB/dDOlTP0
         olLdCaJ4uZOs/IvfPjHzp51PS1p7lXmCZLxF1amdlVJyfi4MOS5fx5IPUtcGabnT2XDS
         3kVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791651; x=1796396451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
        b=1y/x53/6U7eBw6HSxKknm2RVcAMAMKsOkYeV+zW6tr07LuROs4IuWDPr4bNyTU2VI8
         mgwCNok8gsfCiXt4uoRwP/tUwda4i5y4qHtU48zXgsFw1hGOPuoitnkio+mYRPdtF/bm
         e2altANfrLz2D6pNTh4EGSEmLIWuRnqshgdl5+TF5f/tcpkI5EaL33sN6UA/sqchQxy7
         Yf0FSZREO55/U+EZUhb313XoujbeMa+t0QUI/h6HliACboNtTAYxNzzu3jAPaNqqNA6q
         aMxwbfH90/mjGoOxNhcpnoqmO58k3Lg0PE+RtTscN63ivJMGGIgk0hxaJKhthIWtgt9R
         Nlyw==
X-Forwarded-Encrypted: i=1; AL+hErHYtJdjZ7X9QJrHniFivqwPpYXVrg/PFLcLRmVMSQ9+fXz6sAETvdqWrZEen93Grpi34yk=@lists.linux.dev
X-Gm-Message-State: APuU4Z9nQWjocmZ9DtgRZuYPDnYbCwxHjZbV5TsWj5d+3656n6Zz5GEl
	QbUrwoOXLR6g5TKZOawR1XH9u39tvvaIaKLRrR+XxyB4ZgWLMXHynHAbwRPoWlqMHEOuLx6zKjt
	Mk/q3QAuhxC18f/exnLVyxprOPGQ8Rnw=
X-Gm-Gg: AZFdTZfWa4cmhIciMnEnQPZ+jSXSN1F5AUMLwBYOchwplFSkzfAUo17v7/imPmSZHm1
	MuqliOkHwGtlOY1+DnmoZ5JYhfo75h0zWNn4toVD3ZBF///fAIpzxjsiIU+n4OioI857mfaCj4c
	7IJHhOpYM1nQIxO/jSo6Yfxio677GgzxiObifacRcH8kIaTJS1GSjr1VrKlqMjgyUlbV6L4BQrz
	22pON++9jWAMmxLogwfBMsHLSHPHuktNE2hxpPjY4qL1G3JaaeAy4MtXuA2uiB2Wab8Qvos6+eF
	6SaL+lgRJi3WB5NuTmSGjJJpyvRE/Y4MGBTJu0qbi1Wgd/3JP+6G0xUmypOGlI7piph9yllNeQv
	J6Hj3j6NXgOEAby1L9OVVY4zwfLLNWZcXnW6vheO6mNBo2KU5cZt5kqcuDZp1Ih1wGmUeTjmDNB
	Y4omtH8UrqCd5sJzv2jjGjoDJAkJECmg==
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id
 5a478bee46e88-3857111f65amr27118776eec.32.1795791649409; Fri, 27 Nov 2026
 07:00:49 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115085826.89641-1-clamor95@gmail.com> <20261115085826.89641-5-clamor95@gmail.com>
 <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
 <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com>
 <20261126124719.GJ38590@joneslee-macbookpro.roam.internal> <CAPVz0n1xgOqusgO23pXzZdaq0A-j0NyX2PvYPyzrzrqUfYM+3Q@mail.gmail.com>
In-Reply-To: <CAPVz0n1xgOqusgO23pXzZdaq0A-j0NyX2PvYPyzrzrqUfYM+3Q@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 17:00:37 +0200
X-Gm-Features: Aa3M54rzV-ViZY9z6DJq1q92HT_iE_h9VqHJH3pyc5wvVXF_KFD3s5My6-b_8Bg
Message-ID: <CAPVz0n3UgNrS1vJnPhbaEFN1rPMyM1eBHHhVt8X+Vq_Lvc8p1w@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:5=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14=
:47 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Thu, 26 Nov 2026, Svyatoslav Ryhel wrote:
> >
> > > =D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 13:47 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
> > > >
> > > > > The AAT2870 supports a dedicated main power supply input alongsid=
e parent
> > > > > power supply for its internal regulators.
> > > > >
> > > > > Add support for retrieving and managing these supply regulators
> > > > > (vin-supply and in-ldo-supply) using the regulator framework to e=
nsure
> > > > > proper power supply dependencies and power-up sequencing.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  drivers/mfd/aat2870-core.c            | 5 +++++
> > > > >  drivers/regulator/aat2870-regulator.c | 1 +
> > > >
> > > > Is this a build dep?
> > > >

On the second look, it is a build dependency. Since prev patch
removing platform data changes regulator macro as well. It cannot be
applied independently.
