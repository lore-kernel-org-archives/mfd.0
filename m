Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5B15111AC
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057605; cv=none; b=us3VZCsezSAkWD+vHdwhGCi3zzPW62fxjbDyAxQ66fJQaabzx4mUFP3PYZ1jIGbBorzqA9yKatdS/8vFRwq4G4Ff9t9TOL3Plc6W1ZlBRZdai+vEpMEEGuZLHQPnf3KVCx3+RtJQgseHCdRKxbqD6vjzLJXfAz/zO9GNJVUjt9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057605; c=relaxed/simple;
	bh=LoZh/FZ43j/6XETsnFu0fJGChncbgKAoXsW40qHCh08=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LzCwoPq5G4EKqe1B0VBvYy0O5cHnLpNwPrlZrB6nfnFlC/yocUzjFik4VyctJKTPq6EliUbM0tp5E8sYNIps/iiSLkEGEXVuCReD/26NgBIA4LNGkXLalbn1uPUJ1lVOr4Rr93gGzzj6aWvh1MLpNnnriFVfp7Yi0YvV1PR6MFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oshe6dSJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oshe6dSJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D711F000C4;
	Thu, 15 Oct 2026 09:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057598;
	bh=LoZh/FZ43j/6XETsnFu0fJGChncbgKAoXsW40qHCh08=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oshe6dSJXJtqx7rSWSFllYar3MY+stGwzx3jv+x1DXwvK/+HM93HwgftGGZXrGLlT
	 gs+FKrmj7dQaFgFSuIiVnLJIqXNFFE8TY9oThWQxaPTtuPuNqDZ4fj7cBm/Iu9Nwiv
	 QQX6u7HAOA1uF2rg0NuyFReCXk+2jZr61eBFKA6RFq2+Mk+X4cc2CdpjLQ5WOEh26z
	 HcmO2lXiqFaZIuhURRLNtSIJWB7ZilUs97jCGgE7/h39YfTUPvJFxWBxH9KRLwSeKT
	 JzvbDR1qT7SEcBFH6qiAqIxtXtP12FHI01NrK8FPk1O1i60NrO9Vqy3DkH2x3NFAoZ
	 ycLOKMY9494vQ==
Message-ID: <sashiko-outbox-172594@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sm8150-hdk: add display card
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261015-sm8150-display-card-v1-9-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-9-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:46:38 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The SM8150 HDK can be fitted with a display card carrying a Truly
> NT36850 WQHD dual-DSI panel. It uses the PM8150L WLED for the backlight
> and LCDB for the bias rails, and it is mutually exclusive with the
> on-board LT9611 HDMI bridge.
>=20
> Only two of the three WLED strings are connected on the card: the
> backlight stays dark and the boost runs into the overvoltage limit if
> only the third string is driven.
>=20
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-sm8150-dis=
play-card-v1-0-5c14928cef29@oss.qualcomm.com?part=3D9

