Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024524ACC9A;
	Thu, 17 Sep 2026 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685838; cv=none; b=WpkDQf6E2OpK5Oq00HMY2v8qePS9tV+Sac1jaSlF2Qeh1knVsaiJ1B84MWa2xVryCstNWUPTcDCX5Xfwftg18q464rErvIG6YvinyqqHhUkIlj2rbTzMtjr1SRNjvTg0tF9gXJM9SmNKeBLCiHsxE7u4MzwU5HOnERADKzDyyFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685838; c=relaxed/simple;
	bh=5J/egDPBuS058ELk3raHw2GWpkzAfiGvpZIj3ZZ9C+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UG/M8+IBbugtKwD0sAldr4YqHjn1HXPGCsTi+/PY5W+wxh6I82Z3Wfi7Vc/qZkdpP8TrOrVwPryTAV/yX/cJqSAIWpxI+9RUbw0WNMNNSAlD6dUB0uyMoJyPaZRPEi8QBSaHLsSVFhJCSxwkyC6DFQkgJ0cnZLxIbLsVvWvqIlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9Xi2Jod; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9Xi2Jod"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284071F000FF;
	Thu, 17 Sep 2026 22:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685836;
	bh=5J/egDPBuS058ELk3raHw2GWpkzAfiGvpZIj3ZZ9C+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D9Xi2Jod8Dj6F3LnKE8ueyIGyIYNLHg9YnF68PqZLlA0Ml4SF4XBJuMrFNntrK7h1
	 4KdFdOgkhk7bbKowN1OhE4gIuuLQddQpoW4qBLJxhEaaPtvtFTQLqzFovVZhyRYRsf
	 pbXvBsj1Ds5JZ8P9faS+s8qLNvAoDVxLCDZbYTwN38NR+Cb+CcUqCXFugyI23iqnxs
	 lfHw7WNEp8Y9n1YCwMKuvPTNE+oriOehEv/T8sa2MgWu2Qar6+ZMHXdjP5kN0woXBG
	 Eet8uW/T5EEMpaTY/POc3kr1reAsGy6el9GY3LokAkMW/8mKXhao4GtrA32lo1+j3N
	 4/P4t89em0NBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 9/9] ARM: config: u8500: Enable audio graph card2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260918-ux500-simple-sound-v2-9-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-9-88d29416e3c3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 22:57:15 +0000
Message-Id: <20260917225716.284071F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Replace the removed MOP500 machine-driver option with the generic audio
> graph card2 used by the new Ux500 device tree descriptions.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-ux500-simp=
le-sound-v2-0-88d29416e3c3@kernel.org?part=3D9

