Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795250268;
	b=iUkRjGP07XrdZjg9KZZ7wxu3FPqnOjqfAij1D1PabtDlF/VYzAqnPRlxJh36aAAM/96E
	 1Aes814gIbjErkrsfI7W+PVrh4JcQ/QkQ5xtKoiwdftvrmvqCaXJ4gZzYA1TIIAI8S+BK
	 mJcyd0nCL+7lJI4yIyhevEOGM/qtQ9MrJTBNVpagkBE2EPZCURJA2wVVPHXNjKGbwdm+f
	 RWQ6zXkr3fWu7QsO++MMdZOCd7oBVSgbUIVgMQ8Ra+yCcGMXVALEW7jPRWxge4gExLGbG
	 mgAXOK9kcthZ5wohbnt0q2HYMNN2+XTdG7cVSkmxr9IjhFKiuoXBu38UxZEnsVfcAEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250268;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/a0Zkh9tR//2VirCUOORoVRbj991y69Y8kN+/kmcwW8=;
	b=Nr+iAR+f/hW7Dlh+2EdK++ItPyDQ3HZPxOm4ccmsZZGkw0SkqliW2+oyIBUDbZvgijtL
	 TYNJ3Q2nD5rDApeUWP9jMiW/Tr1s6oMcvNyTjRsgDNyk8TX+YJPyS6gru8dbSg1kA8DKO
	 mpuq01FwbHU04Wa1TLKBXzOC+9sVpr3Xgz1WaOaCGsima+qGUPCJagB0TuZAhyon68BiD
	 yAuTKNpyMEtqIwjjwBGevSmDvlfAiKCvnjwR3CooXFupFsj45qPvr9eka50nHTaFCXnPf
	 RvexHntNWdBKBVlRnJKJt0uZzTfGTiBu8rz7+/i7QAz2wv1JZ5umSGQUNO5U08XMEyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fcpkrsjQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B9606A325
	for <mfd@lists.linux.dev>; Sat, 21 Nov 2026 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fcpkrsjQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B5F1F000C0;
	Sat, 21 Nov 2026 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795250268;
	bh=/a0Zkh9tR//2VirCUOORoVRbj991y69Y8kN+/kmcwW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fcpkrsjQUUPniUgb5Ti/qKODWoJrJQ74etXNNDc1T2S57XZ11HZcXznqRrnErhUlt
	 q2AwaRTfRyYAnBFjn6ejhwUg3GZk8GIHOWuiBjU0vSw0VV8X4/bEPjx/VdmQB1kdT+
	 st0MP6wbOeiwPI2uYvmY3upvv0cO/khNze3kbKe7sOFLk8oaODqjhJRT+lg8Qy+Tqj
	 K2kQWq+0oujm5xvmd0mxuqgBqwP8wwj68xBuwEhHeFEymL56VH1Lfb0YsrcKaCUST1
	 MAXZ/NdKJqIzSIfTanPWht1+Hs0y9UuI8a/aR6j5SXG6daU/sc3+HTTRVs/uS14vuN
	 +tYxilXYgFPRw==
Message-ID: <sashiko-outbox-226839@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/4] arm64: dts: apple: t8122: Add SMC and NUB SPMI
 device tree nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Reeves" <michael.reeves077@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261121-t8122-smc-dt-v1-0-898f3f5d6228@gmail.com>
References: <20261121-t8122-smc-dt-v1-0-898f3f5d6228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 08:37:47 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has reviewed this 4-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-t8122-smc-=
dt-v1-0-898f3f5d6228@gmail.com
