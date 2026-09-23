Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881204218AA;
	Wed, 23 Sep 2026 17:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185938; cv=none; b=ngWFER4ycvLI4Kg8Mq3TPO1PHditGtRAlRkTUgPI+HYu+g2XWPSn/RWWnpTE0yQ8Z22XKVg4R10Ld6o/1lRWLsWjS9W2lQz7Vj/5MIdcePfvtRPVvfc3h4P+PXRUsObiT59VBmIuF8AFwt9FJRWQvmtLyQQCwf6RivsOdKUkz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185938; c=relaxed/simple;
	bh=vn9zfnZmuYGEzgvgkmXDWwto2jGWEOP4GnicdM4ZwuI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A065gdF+JsKBilkMM7/VbliiNeIYelg3X528SgR5cJAufpcrnsFo81XGcLtL4SeCndodMFXVhaFmqwJtoy4MZBdK87nmCZAMFF4sEHG5hABJaYip/PySeGOpfZCmqjiL5l/9GmDgiStWW4Tg1qv4FiCzrnEtqrLOBVaYhspr+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMwmcQbL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMwmcQbL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199B71F000FF;
	Wed, 23 Sep 2026 17:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790185932;
	bh=vn9zfnZmuYGEzgvgkmXDWwto2jGWEOP4GnicdM4ZwuI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hMwmcQbLa4jY1PyNic/PdGruFZpkfNoGuPo/cYrqyu4HIq9mEAMFM5S6jmhHty+3r
	 ya4/P+XFQ+b52qcMz2TiJiem25z+IHIbLP1A0AvckWaUuyAkkMwzmMTTP8If56O2m1
	 DXfzJOzbgQWhLpol+4uclFObcfB4rQ/aLf29B2gx3OdOApS1CxBsARBL4spSGWNJ9t
	 8C1U7caWm8WzDOs17Tfqy2ROL2ScPjfWuhBe0/phM0hwVt9QK8pzETY2fXIPkcuPKM
	 pXYz7ZQzzxfBjsoLh+0C/hld4nAWtU6G5YQCYR7diz80lGi+KzcleJ/FnWzvEORRK/
	 dN45c2P8+CxNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mfd: dt-bindings: ab8500: Describe codec graph and
 microphone wiring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260923-ux500-simple-sound-v3-1-56a771c3ea28@kernel.org>
References: <20260923-ux500-simple-sound-v3-1-56a771c3ea28@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 17:52:11 +0000
Message-Id: <20260923175212.199B71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AB8500 and AB8505 codec block exposes two digital audio
> interfaces. Define the codec as a one-cell sound DAI provider and allow
> it to expose both interfaces as audio graph ports.
>=20
> The codec binding conversion also omitted the analog microphone type
> and bias-routing properties supported by the driver and documented by
> the old text binding. Restore them so boards can describe the codec
> wiring without schema warnings.
>=20
> Assisted-by: LLM
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-ux500-simp=
le-sound-v3-1-56a771c3ea28@kernel.org?part=3D1

