Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695590;
	b=S1MFtIc6eBJkvxInLcZK0yQSa5gIXlQMLC122UuHJb1jRukv5ppalypXf+qoB+D2A4nJ
	 /gOWLOn0GtZM7roHL2weTjBFcmtbYDFh+OrjEYDVO5kFMfj84bAV09Z8iX71A73HkEaU5
	 LhWpocVQmbV3F25FLJmSf54m+m6oStK0Sb+MbqLZ0EeuFA/USr5valHthQJw06/3bAyzd
	 4qc6zU2J235WoLVeYxPaA2fg8Ra1IpwY3JPOIx71JK+66uXP5d14iCEpegN4dqK9BWPhW
	 1UjGvTO/tlG+Kp8g4DHEUQyr+TbXlIG7TpqeUdkIE4IlMQDvHC2A2mkzGuPR5tRvukQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
	b=DjBZiddgrUlI0MlJUbEvKoju1pw3m/ju9WO/m26fj6XW8b/CT+TVVz1a9dStHhwvE+v8
	 LAbwI7cBI9YP2P7O+B0JG4vJr+QJNvcBlG8aStGJHvsuJyQ3BfOqaSf04iQUzhl8n3AuV
	 WnF6A3dE21+fpORToHWAIe4DOvSk6JuxEj3N9ReP6g83NAvJYD5uyE1Ms1yBz0s+F7OVn
	 1pqOpyrqw4XFnbrRvYuahXZmYGCPjhuVWQwookp9GQvyp/enTsRZpSyAbGxLCOVyUfLUg
	 OPDyDB0a6Q8gxiJCDitWzd7+c5W+shvgMqd9MRJQDaa1P1cuXoEUbuyy12I5iy8N6jA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MvdGY52t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06394606A31C
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 12:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06394606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MvdGY52t
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38190551625so13508138eec.1
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 04:19:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795695589; cv=none;
        d=google.com; s=arc-20260327;
        b=KlodOMP6zW08JQWjXcZ0C0Cb3BivV09rVj2XCnSzqVtLwnVpGBguoQIoAP2LhogtDa
         MXgQGNrgjOo9RNd0BFqwxdtJ/AuU1Fg4tYzxIErm3GiX+WJ9cx0vpx9UX0QyLLcu1WD/
         T4BYha3o9tNLQVUrDpbek24ddLhpw6ykOO7ssGOkNaVpQr+pFjs+MHegvj332EY4JmlB
         yA/+Jqm9KbWLouuQxGZCZnRBmRpiETupt4Q1Vosd89JlovhJszKs+DxHU5Dwwn0cR84K
         ELY1aOokQEteFam9O/4UIhin3yfRlIj+oXVaiTU683VBdKIqrQRoxtCPKHWFRO2K950F
         vobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
        fh=EI/YwgxVESgAKhxw6dR45ijjWaoe37GHcS+1/5cZKxE=;
        b=PBFdQLllgkTtsrfEU2IZ3BPrU+1EpAZ3uqNhoPnJIeHgmawGKuabLy5ENCLBXN92zO
         zsRIxCV2zzgL/oL4mRzMkIvI/fBru3NFHb83mJUcVscqMHUKZeYgc7BCf8J9ASnqJ1Gm
         Z04j2C6wBMa6BTPgb2UI/9hfnPQrRsy2T/g0NHwnPMWNIxi5NcJyl87ljVykSg/UuqWQ
         SlxERwfZDutil3ZAzlH9uXWaDswiE/f8d51fABUQiXEnMVxBpQmfx0P4bxYZ6JZ4OsKk
         LkgTZ0A5V+MbIkDdK+suTSfZS7Q5yL/1thdB2u+ocqk34EO/A2BuWW14pU/GZfublTrX
         6t1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695589; x=1796300389; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
        b=MvdGY52tVsCFfGAYI0BKz3JnUEXFC/9dBQnSfMVtPPBg1FVJf+cVpSbOw83KBMX8SW
         GGt6TOBIZKyHMVnyqg1cEGbPJV/sn0S/87PSGaeFsOckXCJeruGWNrgo6YifbtE4kCza
         dTrpc/XxI1YlN5oEWpb+YVfLf63QKGP7KvoClWG+5ON+qEMM6qXd7ElDc5IKCnfCxdfq
         mjCVS7bAKR7034WdfYEnNFVcbbVwdL+PDLjvtYVmMVNyUXRBfHksN+0LhdmuNRro6lf5
         hsRYh5ymncWO4OUsMC0hbcR8lL/e6e6PlsTVuPLaTDk1ho3bTXHBMxDAb8d/p33jyvEf
         KQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695589; x=1796300389;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
        b=p7fOPqvsZ0mHEISvDJtxumtksfmZCpUttSSaRSnc9qqRzaXZ+uMsZzIC7mmN+YigyY
         YG0Gbuq2Dd6X0+qCkatrz2hvdW2logrB+ojQk05Q2cePhMLEL+KuLHCqZXjI3dRvWCat
         1k9bV4lPwGgvYJ0Mh4EKTn+Gs9B58qSWoGXSLQdkVy8F76izvCElqZ3d/oShgDt5G/zH
         iUD+gMed7/zWCjZ8mK3KXakETWQ5Y++Wgn62I5FQKn9JinCoOHHKJ7JxyTrYeENS0Wpt
         V/MjETN2gDAhYja0cOPr4JIRkACOnLZmZsdVCUK/cMrFpvmWV6+LThG5J0wxI+53f88x
         2QMQ==
X-Forwarded-Encrypted: i=1; AL+hErF+OhQMyhR9H76CuTefjKNNGbAiQYFZsIJu8TAI+31ZXI+3ROekaMc5Ki0j8xpYOdu1jq8=@lists.linux.dev
X-Gm-Message-State: APuU4Z+XTZ5c/UFXh+7Lt4JbN/W4+YYITBZot1SAjDD/I8z29YnSEivz
	UTL/tppNZY4F54Rzs8BM9E6CS4iFUAU+sAdYGYMI35V0bDOQDu8ax6M+Fxxxu5pSa4z1Vvq7Lkf
	p3o6pnzIplI/NZ4lUFtuBuhWjk+YESP0=
X-Gm-Gg: AZFdTZe7NLD738yU1WvJM7MnNl72kqikrgMCdYdRawEQG2CLtebcEyVZZGWG8HepM7p
	WX4wXsHFYFBAVXJOLzVFk/1PeVKAJg0WstVe3VYrodG/K/rOD1d8tSmb8A4jy7TklPF7UoVjA8r
	Pay2IHBRuQKPzQQf+F3cmLnHmKmXaWsLk6nFb9SDRu0UKjQ9FADKUU1Wl1Cirs2SSDP7STjb1JK
	LYSlsu7vUG2P7faw8iVKLJpynsJ282oCddR+qPYpQICjQyH77MiRdOrXi3pLsdESeITGoGogtHt
	ywcSG6rHUKF2VtB3ldIK2XyUranVyb7HKkrEmInNpnw6XmDmopsd/mHiSGJ1IQhjzBPnpj7RPVT
	A7VxINPFqeyM8gxGXoYiM/L701my6Me8XYIzyD0czA0ob7R3AuaYEjpl2rX4TO4BbeV4h53yNAr
	n7T2ajZCDaW0B2yx98Qa+26Jgy+/fupw==
X-Received: by 2002:a05:693c:895b:10b0:385:cf42:9b98 with SMTP id
 5a478bee46e88-385cf429dcfmr20910606eec.34.1795695589053; Thu, 26 Nov 2026
 04:19:49 -0800 (PST)
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
In-Reply-To: <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 14:19:37 +0200
X-Gm-Features: Aa3M54o45-8oLpV7u0fds3mVX__iIW7iqATGNdrlwb2jFlsQvtadJWGIKMAZpQU
Message-ID: <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com>
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

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
7 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
>
> > The AAT2870 supports a dedicated main power supply input alongside pare=
nt
> > power supply for its internal regulators.
> >
> > Add support for retrieving and managing these supply regulators
> > (vin-supply and in-ldo-supply) using the regulator framework to ensure
> > proper power supply dependencies and power-up sequencing.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/aat2870-core.c            | 5 +++++
> >  drivers/regulator/aat2870-regulator.c | 1 +
>
> Is this a build dep?
>

More a logical link, I can break it but it still will be part of this patch=
 set.

> Would something that was working before, break?
>

Other way, it was broken (aat2870 may have a dedicated supply) and now
it is fixed.
