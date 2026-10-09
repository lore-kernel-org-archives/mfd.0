Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19E94CB8D2;
	Fri,  9 Oct 2026 11:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544487; cv=none; b=FxJNGKdyPb81w2Mho8A74gQPkD7ln4Dd5SV+We8mTUeJZGF7evM40TX9PDsbEeuNgd6aRdiA7XKV4ZncSqig+dkkHXotXRE5XP58Fxp2csNF5V6Z+ygf5E3ejg1j/XcCF9F3mnF5K7/r6779IbHLKGLlUB6XPqxTtZFE1GYWCq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544487; c=relaxed/simple;
	bh=NshvVKe+A4mjxjK406nVgZg70/tM7ozsaOaBA5c9Ghc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aCJbfMwA0XGpccFcOMlcnZ0LGXGsHfTHa09+jxVJzN72GlLYVWSWRhJb2EDeU2vnRT7+airS3fswJjOBTjZES1jKKHbVo1uHVnIDj7hGBHyVax81Aia3aSpV7MwPq3MCOtBfZPz3LcYRwMYf7weHMR846ZzCCFwVKgB9+5XFbvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzrW3fVC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzrW3fVC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0581F000FF;
	Fri,  9 Oct 2026 11:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791544479;
	bh=NshvVKe+A4mjxjK406nVgZg70/tM7ozsaOaBA5c9Ghc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BzrW3fVCQf+T1vUElLULBAgLtVL8lyRZ1kR6lIFjGPFT7nWEX+dSjHtKsE3TjeM4F
	 q2Sm7SxEcg4trSzRBEWl/Mt00zsS0GGG2QAYX3T8aR/X2JofwmiQuRV5qP4NxBVcRP
	 9A/he1byazTMWC1rfGEqdBak0g/6nb7u9Gt9vuiIL8UPjQCtHhACxG46U8TVDHiob2
	 umNCsV95/a/umYBmZi0JU/XXWDNnNyMSsBfJ5V3yq6rWEkNX16PoJrc8CPR/b8NaT+
	 lhO9fLhVhEkjhp+QuLWU9TZTLPzEi5YYd/dkq1MMjt6cRIvHWna9TRQxQrAWScAJSO
	 0hJbO1CsnoGtA==
Message-ID: <sashiko-outbox-165336@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: add Ambarella CV75 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009-cv75-soc-v1-1-808330e93ff1@ambarella.com>
References: <20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com>
 <20261009-cv75-soc-v1-1-808330e93ff1@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 11:14:38 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Long Zhao <longzhao@ambarella.com>
>=20
> Add the Ambarella vendor prefix and CV75 EVK board compatible for the
> initial SoC bring-up.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-cv75-soc-v=
1-0-808330e93ff1@ambarella.com?part=3D1

