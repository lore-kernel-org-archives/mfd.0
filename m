Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802818;
	b=fzH2deSI7EW2Z7AcRc8mK8gFW45yBntO5Q+2bpohqkC8Pe/Q3AgW5VD6h1ckjqOwpqC2
	 AfNYZMptht2u15o5yeJjW6BeZDT59vBawA9Jvtpr/U4a94LY2ilprYB0JDokkRbyC/Mg5
	 ihhNDtRpuZtGRoBVqVRI7TUcBJ47hIJ8p+lzA1wZbX4hSD/avhak+byGUovVOG4c8amIH
	 AoQPiQ4V2QKPVCNE/teqtZvgpCccZ87l/0ymJvwyY+gGFOtGdHaxGcdMOKK8YgGl0tARe
	 aEL7l9rMoZbQAWBmLwcxNPicHcbZSaaspXE0bqKR8fT6L2s7vB80W+icX4Pi/aT4EZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802818;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Mum8cLNZYG8+0H48y9U/YWIUkLYKYR68f4GvnSoPzVg=;
	b=lHQQaDJitoZHto91adclqwQ9bPoCUK5WujxK/HddDU1CtmdCtJEl+/+rCquZb7AnbhiW
	 yQ3UsNSJLpK22Co0mkw2tjLINwEtiHWsb+KaX4KelSrFx6y6tW+YJrtz+d+jXcGJY0GTH
	 kJ0gxoOtjrhCotmNJci+1WKhiGMa5ANSyUb1QWzlU5q/jJKUJ5EyGUXOyG+2QxLCUhk/n
	 S1VbvSjgByZ54Hh+og52o30cSBmtxE9LNb4G4bsix6JDlnxmY1Nv/ER1odJcTUqVrPOzm
	 +0zdoPTU/kVYtRBem7DlG55nchGsai2U7a1rtVj5QU0z/D5AXCcklMDOf7d24iasRIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PPbaVjls;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D24606A321
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 18:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PPbaVjls
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063381F00899;
	Fri, 27 Nov 2026 18:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802817;
	bh=Mum8cLNZYG8+0H48y9U/YWIUkLYKYR68f4GvnSoPzVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PPbaVjlsrPjjGCxgS07bHUTlguStTL1BrVJdJEmy8UWjfgw6Gz2XsO0ZMcHM09vVA
	 TNCG2R9EJGCxeOfg/ui3i8Gr34PtYLaJhs/IgIo0XrNLSb7R65PHqXoNmTGYm2CS3k
	 z1+9Lvafb5t8/MD1dhmIN6KnjDnzw+/tkEoOygWKZZHYZ+9+bolMF6SYXGcVZSRwJf
	 VNUioKi/AKIx+diV6H9nE+3i4i5cgTSqJPO4066dKcCNqma3lYPZzcJXXL7zA0I1vH
	 g2eHmDEg2LJUMAlIUk7XjKCJRI0aMCeQz5iU+C3DxplHo8G5G/9PkCNTdyUH0gq6Yu
	 0Nwyq0GeL6Juw==
Message-ID: <sashiko-outbox-238041@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 00/11] Congatec Board Controller: Add storage devices
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
References: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 18:06:56 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has finished reviewing this 11-patch series:

- Patches 1-6 and 8-11: no issues found.
- Patch 7 ("i2c: cgbc: Add support for fixed frequency buses"): 1
  potential issue (1 Low)

A detailed review has been sent as a separate reply to patch 7.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-cgbc-i2c-s=
torage-devices-support-v7-0-d0e70fc57879@bootlin.com
