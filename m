Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DDF389114
	for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 20:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207505; cv=none; b=MKMgUSWVEC8cdCp0Qizu8KleEafny74mKJTZIb/4pqeN+3F0PpJTkGgY3HTl3gMPQixz01YwU5IqCsUNtyrvcvJerm60k5Cb31NffVt0Y4uGUvSyCWC0CzXCpcRgdiZAbszb3IEzVBpgN+JN7zuxkvfQUEessXAkKLh9/aMKK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207505; c=relaxed/simple;
	bh=uxXnywrB964lFHIlbAx+gl0yKJDMUxBJ8k53z1N4/DQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPPTllvuUGRqDxnRDqiHcSUO7JB/zSRvdL5XuJwowAhej/YMp0dklos1JDyRA7spqzzMVECR0HPftsCwhEs9VhOz5bHgTgLQBYoaGsqeDmU7N3xe20lfvcmIWIAnzaxuJyKjHXdhfbCN4hIJ4bLPUOLvaza4qIchI4+eUCy42/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZEyv+My; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZEyv+My"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A656D1F00A3F
	for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 20:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207503;
	bh=dBw06eNRTDzQJpe26/cWXwzg6j8pKh6C6aUf9EkHB6I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EZEyv+MylMpO+T8PDxd5NBLwn9f2oKY4Akg0lM2pDOhv28sjEHtxYCzjKI8PBMoji
	 O3uEiiSNOfKEl9CLZ9cBnQCzVN62OC5/O1e/2VFgOL6ZIJrNvRgkiTEdWZOT6b/5+4
	 Y6a3aUbL5F99o/D4oQficnS7meovTHjzaA2pSVL/LOSL95rKBM4bTtL6/fSpzNvxDB
	 3V7BZBcJlrceRv6e/7YKxLZDYw20lfmKTXXarMAs7JDiAC0ehHfrMLsvhH0FMDih6b
	 8tAcKY4Z5h95sSYKNQikEv8UbAZHmXwgFC+qFg2yCxJgKyHyD1/Hh5w8bqnwirDVFy
	 hLti5RYZi4oSg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b159850b16so1245062e87.3
        for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 13:18:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzU3O4bqVuFFzGI78S5FfzJe9HOF7lMEoIlsQ0CYezhUHdATZHY5EHJao8giz9TTI6y1PU=@lists.linux.dev
X-Gm-Message-State: AFuF++kt+D8oZEDxBVcK2we7t3NJ0DzhfYB3lhMJywJnv3iIcU5rVtvs
	v5GhTy7EVqZXRac7gTh/UM7L1J9eMU3zzygtTEYRZ98X9ybKAeUlxbl3N1TYmb80VG9FocH47Hv
	OclNfhWzaDL4GrcYTuE000DiNpaDMiAo=
X-Received: by 2002:a05:6512:3baa:b0:5b0:197b:9827 with SMTP id
 2adb3069b0e04-5b5fe058e29mr1175861e87.3.1788207502384; Mon, 31 Aug 2026
 13:18:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-8-fe279fff5e18@kernel.org> <20260831-subtitle-anvil-0f33fee6c2af@spud>
In-Reply-To: <20260831-subtitle-anvil-0f33fee6c2af@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 22:18:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLnBSrzXnPdtr_NqTymqBupYv_-xW3NAMCa=7Dx1RwtAFg@mail.gmail.com>
X-Gm-Features: AcwNN1VXZziHPIGagW8xwoy-VUmF5diU5-vmep_nHTuTWOlYmAGJFJ54vJZTXWU
Message-ID: <CAD++jLnBSrzXnPdtr_NqTymqBupYv_-xW3NAMCa=7Dx1RwtAFg@mail.gmail.com>
Subject: Re: [PATCH 08/13] dt-bindings: mfd: ab8500: Add regulators
To: Conor Dooley <conor@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 6:18=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:


> > +            ab8500_buck_smps1:
> > +            ab8500_buck_smps2:
> > +            ab8500_buck_smps3:
>
> How do these differ from
>   regulator-external:
>       ab8500_ext1:
>         description: The voltage for the VSMPS1 external regulator
>       ab8500_ext2:
>         description: The voltage for the VSMPS2 external regulator
>       ab8500_ext3:
>         description: The voltage for the VSMPS3 external regulator

Exactly in the way they say, the former are internal, the regulators
exist in the AB8500/AB8505 silicon. The latter are external,
they are just control channels for regulators outside of the
AB8500/AB8505.

The three "external regulators" are control channels going out
of the AB8500/AB8505 to control secondary silicon outside
of the AB8500/AB8505.

It is also clearly seen in the Linux driver which use different
registers.

The similar name "VSMPS1/2/3" is incidental.

SMPS =3D=3D Switched Mode Power Supply.

(Customers didn't much use the external regulators. They
usually implemeted GPIO-controlled regulators on the side
instead.)

If you want I can add some verbiage explaining that they are
not the same despite the name is similar.

> > +            ab8500_buck_arm:
>
> realistically, all of these should have -s instead of _s.

Can you elaborate, I have a hard time understanding that
terse comment :D

Yours,
Linus Walleij
