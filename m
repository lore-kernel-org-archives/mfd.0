Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2869B44607B
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 08:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113814; cv=none; b=JH/PaBg/z8A5vgegWOjK5K/DeNKTR0+CzxwFx141W9usKFXN9SFn08W7LFPpovzaVOFRaSeEcK0+fNam1d1KflmURNKo4NWyairXkhmrVpEILkcfDtn/QrQxXYvDnMh8ZVKyZESEVhP1TC6qo+FGK6Irn0Rlvoq6xOSuq+0x/hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113814; c=relaxed/simple;
	bh=Pmr1zFWLLyUrP9pTv4EmEZkugbLlSXEPEM1233Egn0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=leGu7rrKRH2lkGL2+8d7ywJLqlkoV3WVVU1A97lIUFsuTwrOJDoaOLdHSac1nR4QrFLTQeqrTWZ5gxElxWKr4yrw50oclZJFJKSZ/rRwWZopPo7oxUaI09Q9F6Z3xD8oTym/E2DgpOKobt/N70Z8cQ1oRqD6PPOOI2w+WqquYh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2GmrN90; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2GmrN90"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF8D1F00899
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 08:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789113810;
	bh=Pmr1zFWLLyUrP9pTv4EmEZkugbLlSXEPEM1233Egn0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=U2GmrN90RD/c8e9R2zbI6MI6iktTO0InOKh1XNXjegmI/XugpnpR/ddSSbisnrhsB
	 vqTK5HOIlXOiaCJFzt4u759QtSsVXt7EnjYBM9GXBH7vVltbUsSo8CDJZmSJS/jpQA
	 hvAgFY1DI9+lDk9OWi3c483DQn2UP+AU628k3s9LPBoPw8E8VTKUqVjrg74AigzNuV
	 Hdd6KdWeyJB789kElRhNU/h3FdKO1AlllaeRYu2TwdhmlRlTAMkhuRSY4NQr4KAi5m
	 4Q+owYPXpKFOPnEo/frxU8epEnIPl/xdOcqrJB4LOoccL5sGwM4sFRulR28s4+3s/n
	 i/4bERRCP6S6w==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so772850e87.0
        for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 01:03:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOIAy7jMEHU9OmRA1JZhYJTZD0YGa9M0K6+d1+Xvs3BNsBZbCQNrw2ezm3JTisVAbUtiQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lJvYb9ALPhlneG2kbUdBbG0atulCrbu5zb700Sm6zacLQZ1kv6
	/0jt7W3HMY7A34gQk99EewvRkx04Et98Mtmb3FnvS4DRSLcwBXSTBoWFsy2GFB6fPNVVYvaHtTI
	T+vcNWUQcDVmJreyxsiLzQjrcvIPXAWk=
X-Received: by 2002:a05:6512:68f:b0:5b6:1a7c:59cf with SMTP id
 2adb3069b0e04-5b8a0304560mr723222e87.41.1789113808874; Fri, 11 Sep 2026
 01:03:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 11 Sep 2026 10:03:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLkkX1yOcuZnTZhvi0vgrquffTGFoVznfz8vCOjNjiipYQ@mail.gmail.com>
X-Gm-Features: AcwNN1UfnXECHxtGopjI6gR_i_DsGzT5cXQ7pcJChpJOw_nkxbdKVBlNEAR5xsw
Message-ID: <CAD++jLkkX1yOcuZnTZhvi0vgrquffTGFoVznfz8vCOjNjiipYQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] Add AB8500 buck regulators to the Ux500 device tree
To: Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Tue, Sep 1, 2026 at 10:02=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> While working on the Ux500 power domains it became apparent that the
> device trees were using the DB8500 power-domain regulator for supplies
> which actually come from buck converters in the AB8500 PMIC.

Since Lee applied the prerequisite patch 8/13 do you think you could
apply patches 1-7 and 9-11?

I can also resend those separately if that's easier.

Yours,
Linus Walleij
