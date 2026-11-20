Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159611;
	b=FsF7z/1eppS+GcAPRakUBHs34t7n2lg3UfRZat4P1HjjrR3bys/RGcDO0jn+Smdr0eHC
	 zOKotzaHkZ8XdZJPRgIe5/c1mqZduaMLPAAZhnaZa9F0NEtnbqj7TaJDUeLgU8hGxp1L5
	 3rahbkLbtzUmWLmGKys7TmmxTdM0a8iNis3FPbSWP1dm9Gfri31qAGZGQFgALRtOXWOzz
	 06J0VqCE8r1KZ76WKcz2RiiCPSh9/WU0DTGMBhZn++PRQRzAKaLVhHN33jwJIKk3aH6zk
	 zbedFllAQbLZVwi0l4FfWMYqfPbkqdPKZ5IzYZlSoMS6TXBZW4FbsMCSxb7RdgGvOdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159611;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pk4lqjemciK+qnySUyXMQ9iDvo/fRbECYIz1wU/DZ3A=;
	b=d7/FJAKCRtFbPWFJ32gFAuXEbJ3aec77Sgg2AN3zmnA5PJpLLzhWqXMXdXKJEk3RhbIu
	 zX/uRRVNFpnyxm9niZER+nq4+HD1zq8qX2X0ZDOOeRbXJquwezR7Aecasz8T8XpgfjLPr
	 6fOc65TtcdW6ezoWzFXtZ3IjcOOmcUqc31eU3FKYK90gJl/e7kzxBV+RspDELDA4SEZQ1
	 7SslcbjPpQjK+VPZIRjdbHfRKC18hA1bEspUjfVPnX2dLPwlmBlR7lp/dWgwYpoWyN0I9
	 Xr1534GLkh1Yzb2ZB0kK3N8wxuRhKuVC/CXMypa/dDkg1OgGbuJZ9uSHst4usxYlQFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6BQU6v0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9B7606A32A
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 07:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6BQU6v0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEFB1F000C4;
	Fri, 20 Nov 2026 07:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795159610;
	bh=pk4lqjemciK+qnySUyXMQ9iDvo/fRbECYIz1wU/DZ3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P6BQU6v0IzZI30Sbq6KfnbRZbjz2iEyv5MhPAegHxgeT47OVm06Ci2yACfuo/1/sq
	 eyKPY0z6Pk97N04RyXVXS+aKmBLryubAP0YdYFV3WiRS5xuUYK7puk6q5la9g6qi6m
	 nh+UfScD4ur23FrBjXpI2V6JeceuCpMFEw3hROU+R3b3IjbjU2pzwpe/T7SjYAXW3o
	 Z3pr+fKpiZUezKkTw6d9Lr6ntAdmgKQ9lypmC/Na+TJMOmEAUFMhvBxy28R8vOaXID
	 7JDDd0FDZEoAmLeNa9PXjILeQtfZt+qipAbcDXNXpxHlCbXLvoVBBp041cGUyUZVMx
	 0GbCOc83Q4PHw==
Message-ID: <sashiko-outbox-224625@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/5] dt-bindings: vendor-prefixes: Add AAEON vendor
 prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFBlcnJvdCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <thomas.perrot@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261120-dev-b4-aaeon-mcu-driver-v10-1-a756687e7997@bootlin.com>
References: <20261120-dev-b4-aaeon-mcu-driver-v10-0-a756687e7997@bootlin.com>
 <20261120-dev-b4-aaeon-mcu-driver-v10-1-a756687e7997@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 07:26:50 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add the AAEON vendor prefix to support the AAEON SRG-IMX8P MCU driver
> devicetree bindings.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-dev-b4-aae=
on-mcu-driver-v10-0-a756687e7997@bootlin.com?part=3D1

