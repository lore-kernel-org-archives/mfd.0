Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1FD329C71
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 07:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432998; cv=pass; b=Kd0N0d36pVb8uBuWG+FHjoklmAYPkK28wO56hgwKsgSJFq6JSJY1Gz03fCUlUYqm6GxgoxTt/TsCTwLf5ktnWPVucb1QUVdxnLjQq7LA1rkrDk2l7KDzBPZGUq9o5CBKsjnbfimLxdcn0PLImhRRgiSVJeyif5GzLpaRS/HlldM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432998; c=relaxed/simple;
	bh=yHbrcN2txt2k4QTXQtVEbYyaJnkVhYsYaFz+JtTpWtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKbz3pXkeYe4y5UEPn2xQZ+KmkVMjeIG6iB8z97k9t6aKs5J7s5a6MTXUXJM9C9HDb+Rckz1uHnbr7lltRLsHAsOaNwYr2RPX56ADmdKQcba9N4TyPvDhWVOKuxlyhO7I3yrMHMrm2OE8h0jreIeV1XoZdFj7MfdmtlGembjPMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTpSAfnt; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTpSAfnt"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so4370413a12.0
        for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 00:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786432995; cv=none;
        d=google.com; s=arc-20260327;
        b=c22ucEsKoEsljAUisiAFZla5aUQ1nHV4ymT86nePWYkthd2sPfv0LfBIoWR99EesdS
         t04H7TGuo/S7v2PCaTUeSMSr4n1MEg3BNup99rEezaKi0p0WjcxIhmh4M/n/UiG+locH
         IBdgNQ2Mi17OyaSKTm93U9DFGYeixLrCmVnITU1fjWXDQvbNjvTZqKnUR7ngCPN1ckLS
         ILUtdF4ys1dRlKgcBfQTfOWQDdFQqtRZT3m9rVMnL4xBmKEr3eiYx/IoRCjYxHtEvObP
         mBde7lboFGrNc3RydZRcO52JXoDlgW5Oc4O7TnPFzFhUJKO9d0AvZGg8sYLdjyeEE7ew
         T6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yHbrcN2txt2k4QTXQtVEbYyaJnkVhYsYaFz+JtTpWtA=;
        fh=rpNRgNQCWKOPxx4J7CEvMXiGwh/IkIj6/DmYR4taNUs=;
        b=VEl9zvVF1EBLQxMFEceVQ3zi8RqsX/eT88JyEE7OT/JYpXawCG+BE75bdcfF2g3VrL
         lxWYE7s7+V9x7IxT84vc4W4bcfJr+pm+9Gci/RtYrYYIheLLZj1b8QM4DdkthJ5o4oyz
         EiHVIakf4BhGqWz8Jp0t16c37cdN00g0PtazTmOESL/gdr7p0WzCrNfaQkXd7oWl/mx9
         KtRLoh1YqNyJOUGE6wFmvtQhFIWFXpFPGUGLaHaAN61p1EqaSmlRWZmde8OvBKBaim9d
         kxyIvnLk8iReFuVAr9AeVFrZNYhwBTDtoWuLh+d33szCM5hHVNOGSdCZ4EWWXHv4+ay9
         WNLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786432995; x=1787037795; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yHbrcN2txt2k4QTXQtVEbYyaJnkVhYsYaFz+JtTpWtA=;
        b=dTpSAfntvvnqjUinami8cIiuoJEef/ukjdAyXdi3qdWubhCqBJUexhs9YUD7QX9sy5
         wpSqfBkKt+4f/2JRnTPm7M4lTUoJdD0C3jjq5YT25q6ngrqhr7C07h1s/Wx2s0dAsQg4
         lMY4IQdm3mSSNSiJuGV1DZqhKLVAafFl40WnF9QEHBh3lgjdcdIv0z9qx1xt9q9TMGg0
         Xqy/6u/SB+9GXdWjWx2+h/BVcIAffNX1/bcVI25kbiULcW6JRhIDXIZ1TGjC4layh1va
         AztUilJqMmSZUbTumKZbpgXh6opEPSZx3TkqnX1Cujlr5m80dpte5aEmZingMHzlPRWp
         3NBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786432995; x=1787037795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHbrcN2txt2k4QTXQtVEbYyaJnkVhYsYaFz+JtTpWtA=;
        b=QGwn4nKP7AByVSsIHLjcl2brXCD3xTYasFI2QGc7SxP1QVYOSklauC6YHRpZtxoyXr
         uvGYjyn5EIhzYG95CslDUJZh/djkrJOfwj2B4LxDSrgaTyiZiybgYa5ho8kAPu4cAHwe
         YFb1h9kJygOB2a88n7FGUjbENqfKgFIFrA74+WdUX1DPYQZSPUaQgPy340Si1b4XiKXP
         buY+wHyHrFlYM/B/5RBEM26Tf68gxR3uYFpF21hIV679O6ManO/oHoumiNonIhd+b695
         LDYG5e4O7Bo5i3kiXe5jEYpQYN9UBmI9Kp30wXGTtO8dariwRJFAf69M91Bn9KeQyqVH
         1UEw==
X-Forwarded-Encrypted: i=1; AHgh+RrhbuhJhR91O0tfY1komYfKO6+jSw0DKxZECUWCu56qtfxG6qvXmcXhPTE41d++logJskI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTN1D5aUp9Vp+9NFn0snxHHp2stIw57NSL41bYKE2EApUN4xxf
	Z/+LURqtdE0HgouZUeAq7Lprfj/cQydDscA0/lNDblO9unHfo+0GH1VHlTydkFVicfF/bUxxjbs
	UKS9SPxqfF+2Tx46f6g4ahJkxmR50jsI=
X-Gm-Gg: AR+sD11XXU1SUEgBZif6FTWs+fi1eMNEljomwv5tRxnQVQw7Z1YsJAEvAFkv9EcqmbR
	iszjX3+IMpWYhkRqCOr7wrWSP0npy0wrD57F7R/nr4pbETNQHXNprfp2rScSCmVflc/jgdiwwZk
	T1t9Ruku8l4e5QBtaSP4rcCnY31L4Bk4qBrNmKiH0wQo3EjtufGAY9mDFNGTNEQi5eZa3N8Us+v
	I/uNlxpA3XpnHE9TgiO5esvHr/yt0R9JOoRKwF8Ga5neNCzpuKEywj7kXjZU6voQkf9PyV6XgCo
	YKA5Rr9qnJjTOya5m4a4j89G9nqUJNri7hJDbxvUliiezUssQJEaYOw+SXVrWJsZyjvWNDhi5jl
	gi8nPHwfMjCS0b3YyiKcdC5UNcBDsIvNQL12jQm5312s2boYY5KBXOQZ5hNeKOvqjJmGeg861Nb
	FMtsYUZ68Aol4HXvH8lcuksRa/r7p9TeAUk6DO9w==
X-Received: by 2002:a05:6402:912:b0:6a0:9b04:bf76 with SMTP id
 4fb4d7f45d1cf-6a3645207b0mr709391a12.17.1786432994503; Tue, 11 Aug 2026
 00:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com>
 <20260809-submit-acx00-of-dynamic-v1-v5-1-bfa1f8518b28@gmail.com> <ec826a71-bf33-44cc-80e0-dfc7e92ceb61@kernel.org>
In-Reply-To: <ec826a71-bf33-44cc-80e0-dfc7e92ceb61@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 01:23:01 -0600
X-Gm-Features: AUfX_mwSJJFbFSerCvy_IW10-8LHnrAWQBwEVxYFOtjInvRCI8z97kTvRuJC4Oc
Message-ID: <CADvTj4r==rKP4ThVZog51MQ2AVDLZNFwrPH+uDLFV2wGZueAtQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 1/5] dt-bindings: mfd: x-powers: Add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 09/08/2026 22:28, James Hilliard wrote:
> > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > audio, video, RTC and Fast Ethernet PHY functions.
> >
> > Describe the parent device and its shared input clock. The Ethernet PHY
> > is represented by a PHY package on its MDIO bus, with a phandle back to
> > this device for access to the package control registers, so it does not
> > require an MFD child node. Function-specific supplies belong to their
> > consumer bindings rather than the shared parent.
> >
> > The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
> > matching the rates encoded by its documented clock selector.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> I do not understand why MFD and net are combined. And nothing in top
> part of cover letter explains me that (which I asked already - any
> dependency or merging is THE MOST important information. Where do you
> put the most important information which maintainers should see
> immediately?)

The AC200 PHY control registers reside in the I2C-managed
multifunction device. The AC200 PHY backend therefore consumes
the regmap published by the AC200 MFD driver, while the AC300
backend accesses its control registers directly over MDIO.

The managed syscon registration change is used by the AC200 MFD
provider. The net driver itself uses the existing syscon lookup
interface, so there is no compile-time dependency from the net
patches on the new syscon API. There is, however, an unavoidable
runtime dependency for AC200 on its I2C provider. AC300 has no
such dependency.

> Bundling it together suggests this is somehow incomplete and later will
> be finished, which is wrong by itself. How to fix it - decouple
> dependencies.

Could you clarify whether you mean that the MFD and net changes
should be sent as separate submissions, or that the driver
interface should be redesigned so the net side has no dependency
on the AC200 MFD provider?

>
> Best regards,
> Krzysztof
