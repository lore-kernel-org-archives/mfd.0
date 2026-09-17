Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18C3427FBE;
	Thu, 17 Sep 2026 22:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685826; cv=none; b=d34Nzs1L16ArpXTQjASxI6XqrxKtePXOhBaFACTXJjHOH3iNrifHMvnPaC0HhWShXZZphDmMVD+cnFUUKdnVLjGkO85gnx3vm32x8qCC68PUte4/iHaH2Izf20Vlz/uNMz+JALXqOwAlM1fVbjziXyKqwDC4fXQZB8SIPeC4eBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685826; c=relaxed/simple;
	bh=yDmprYu4RK8oMXEj5ErboZvr/jU/neQdzKImhFCmTW4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=APTWqMvjB4/wLx7u4ked4L+JlALHG3j1kZCdwR8Xj6SmIKkm4RewUMU94zHXUg7LM3OvWtU/s077Uk2gRnW/9MpKcF9HEbssxfN+4rGCCJizPWQc2VlDbQmL0dDsoDaxRtnPsa4XGt4Eb/PpCIeJOyxMGsB9svwuUj5BEiiQQ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C08Vodjm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C08Vodjm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349AC1F000FF;
	Thu, 17 Sep 2026 22:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685825;
	bh=yDmprYu4RK8oMXEj5ErboZvr/jU/neQdzKImhFCmTW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C08Vodjmzx+VlXvQdjan/LNJOqi6TyDnU08LW+po0iwgKWXuWvDy83ZisN4qlg3+K
	 6RHBQF04+Dv833vjBqtUNld7IVPX1dFlnoZxmgYNiP+FXBp9jLvzbFekwpibhRTy3I
	 6XJk2YiQCl58aTmcDtSSMm5pbKXfLrKlJ9yFscZXq49NApwmwxwY9bq/RXkNiZpHPj
	 mNzLaJCHaa1GqpjZNyQR2skiMEUvIUV+dYCjVrr79SN2FP0XNwAy76FHnwsgxN1bNr
	 5fN13BhxcdiZQu1mxliicS1uxZ5pa8DXVXkGnfU2vaRbKX1c3Fd3X8bWxVq0keSTuf
	 bMN83uUAR58mA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/9] mfd: dt-bindings: ab8500: Describe codec graph
 and microphone wiring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-ux500-simple-sound-v2-2-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-2-88d29416e3c3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 22:57:04 +0000
Message-Id: <20260917225705.349AC1F000FF@smtp.kernel.org>
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
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-ux500-simp=
le-sound-v2-0-88d29416e3c3@kernel.org?part=3D2

