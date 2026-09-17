Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFB34A6CE6;
	Thu, 17 Sep 2026 23:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686480; cv=none; b=D/88P3n/ci5HYCOdO7dMu+GQnxvF2piCnhqB5sTxpbAzzCf1wrGgm4V3cYEX9YzexYW8bV43Cye+Ks7bwsVceWPPeIWsKgRQfHme9vWG4Xvyc61zEx0h+dRarkDn1CVUKfvtGxabklOmR/m4vc/CA7/XhvsOm0bBjuOkI1+v8lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686480; c=relaxed/simple;
	bh=HgbxNXZ+ZrVfVFhmLqoXXzrswSxEJUgNjmg4qaS4DSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OD8SkWVwB8IzVX4wOQlJ7rk3YGYheoGyMOCtxRMGp21U4aqJ0GnelUBjowN0Q/hBc0NeyQHTtZJZwvYVl0nOy/BKgFRQ8J3llznByGya5VXwWgcLKB0IlXsOLtLj+iCCT9Uj/6S0Mjy5qsH1mDjAhBGCaL6Fx1zmPrHNrlLvCqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YW5be2ze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YW5be2ze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C82E1F000FF;
	Thu, 17 Sep 2026 23:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686472;
	bh=HgbxNXZ+ZrVfVFhmLqoXXzrswSxEJUgNjmg4qaS4DSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YW5be2zezlrZbz3y15bZ4+C60z6jkoCNi7A/r9/QUxplh5MlgghBYG29/rXJpZmn0
	 8qyR8aMWra0CwMY9lqJMxZiJgsjm/zwui11GGFl6z7DjDga8tAMqPeDTkzNDcDUBof
	 wD4ZoYR6DHX+mo0D3qjq3NLQvDhcO6jYtqK0arnDSkq/ZLt1mz5dVKksHNBOiNh4rI
	 UyykfPA20J0IMY9KGnc3y8hsL8IsmhyrVLsX4wjuwbvMKKn3eqLAKLftct27Lh0To0
	 Dwxx+8irzKENHf/c65+Uj/oQ21mY/DatnaeYVkK8oCpHv4KL06sub3ylzZ6vbuARLl
	 dmrOloDSgm2Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/9] ASoC: ab8500: Skip digital microphone support on
 AB8505
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-ux500-simple-sound-v2-4-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-4-88d29416e3c3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:07:52 +0000
Message-Id: <20260917230752.8C82E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AB8505 does not have the digital microphone interface, its six
> input pins or the VDMIC regulator found in AB8500. The shared codec
> driver nevertheless creates the entire AB8500 DMIC DAPM graph. When an
> AB8505 sound card binds, the regulator widget requests the nonexistent
> V-DMIC supply and falls back to a dummy regulator.
>=20
> Split the digital microphone widgets and routes from the common codec
> graph and add them only when the parent MFD is an actual AB8500. This
> also removes the DMIC4-only AD_OUT4 path from AB8505.
>=20
> Fixes: 679d7abdc754 ("ASoC: codecs: Add AB8500 codec-driver")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-ux500-simp=
le-sound-v2-0-88d29416e3c3@kernel.org?part=3D4

