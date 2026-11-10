Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305703;
	b=W1vksmtSWmJSYg06V339aPacOxuI9t9SigSrtbe+f/ztFCCy9n69CJsMy8PRwU3dPJwr
	 V1ULqPFVH3ocgM3hPJUIhJMmZJmm+3ioAjzMxkq+aI9SVoispHpXtSDKprQurLob4XLHa
	 jkbABcqSQOjXIzyxMwTojR6vF09MyO0xNxBZr8MyXRq8baGLGjIf7gS5j0++DKriNagc4
	 Je4sp2NSVpvCsuz1Y29gcV/cg6T4eK7Nwa/4ydEtqxSjUKPIA46TA0RgkQWt96K73A11a
	 m1h4dlXXQUhU+LwvV1737kJa5opif+B9HueqUGtZLpQgqicYCBrdZUzFMwJbciVpOyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305703;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=asRHrek4HN66qx8Ol4qbZ51l3zyJ5i5rEucufcz17Ak=;
	b=BH2iphIEgwEEbDZ2qca+JPobN6Ydop9u2CFBNCLbZJLdx5rOL6TKtFTw8xPmwHf/yira
	 dsMuZU59aG3kfAfW/xGUdIopCmU+MCL0fsXYvySKpQL6e0kXcqCiXTia/D1H2t3X8nyNK
	 3RvD8xD1Hy3XSOQHK+XhIH+2n0ldynm9gA+E0IqALZRXBYg9hDZp7Zubv7/1DradFYHds
	 zi7MLOdDEyuYu+YpFrNoev6PfgMDnUg7dlVe3+PzPxT8VgIdL6fXa2IjoVj6PF2LWHOTJ
	 Ldx6lbGQpFRZSMdXTwsNzqzJ9zsF+ut6toLVvybw/nq407RhZCdN7WpR9cDhsQo4P+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j4NYXmfV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCABE606A339
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j4NYXmfV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EFC1F0089F;
	Tue, 10 Nov 2026 10:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305702;
	bh=asRHrek4HN66qx8Ol4qbZ51l3zyJ5i5rEucufcz17Ak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j4NYXmfVksX5yO0eL8M7meKzON4hGMjbVGyuxt1WStsDNfa5r2H2aofOjRgHMYha9
	 B+2Fc2NtdepPUIUBeBIEc4GAppI/Mf5D8FGfJByw4/vRAxdRM7eBBKypWAYc9Kzi3a
	 xfJ7an8qazf5ySYqx2eIQ/bFZ4YbLllzhotnvPssrH5hI7Kvb9s1d70F+3lDBJZ1KX
	 Q4EGOjCAP27OcYTJxOGWt7H+0ne4p5+NXGPlkwSq6JPaAqnBG90flSHyPWLQBmNZqy
	 zov65wYs6m8SC69ToMs7E+1eC0tVx80XTzu33SptN0Ld67U2nGUgGaQxDz/s1AOcwT
	 3YatuWl+aON3g==
Message-ID: <sashiko-outbox-206846@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: abx500: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261110-ux500-pinctrl-bindings-v1-1-a9f0e9d12d19@kernel.org>
References: <20261110-ux500-pinctrl-bindings-v1-0-a9f0e9d12d19@kernel.org>
 <20261110-ux500-pinctrl-bindings-v1-1-a9f0e9d12d19@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:15:01 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Describe the ABx500 GPIO and pin controller in DT schema, including
> the nested mux and configuration groups used by existing boards.
> Reference this schema from the AB8500 MFD instead of rejecting all
> pin configuration children. Found with CHECK_DTBS=3D1.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-ux500-pinc=
trl-bindings-v1-0-a9f0e9d12d19@kernel.org?part=3D1

