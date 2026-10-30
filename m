Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336073;
	b=g4v4yrtjSEyugYYOje8V00Iy/a/tJcYIWoJtRORg19dSePQb4Sbia9lb2YWeHNpzijKT
	 XQfRGnFNZttVCQd8cTZKKxYjWf/7AhzXyiwxNGJxDn9GKOyOCn0BwzSeEVtq4QA37rDtF
	 jcqIg53AOWaZVbNt7SAXVnokHlM4wkroDMdkgf+U4JtbFKSTKvAXeWF/PC96BHB7BsWvB
	 HxrkELsoT1YEkK0+YjCvxJkuOpRUishJU37CY3fUzAHjltNPjcXdIfKpXaQf79kUVZUx/
	 L8G0QruZcFbuX6Ll+aEtcrz5MXMVgQVyhKqLNtWtOkdKxUsBNKXwKGUrzEhlrHceyVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336073;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Owkm9qy/SawpQc4aqiI7O5cS4oN2Wgl21fy4+I5xZNk=;
	b=LjOZBqZhQROv+fVnlrpRzg7Nq0r2YhD1BmqxJMRbFNVgCgcEd8AOljqj3QSS2CCcdCJz
	 cMNjSD9WX2E6kAZ+Nlo74ZVO/49lyiB00GIUPK1nMbcMovSD3qaUAbmVnv714Id2LjwBe
	 GuSXbj0WPi/y9PrQQ5+pFrmw1F06hkZ9A2MxSlBxzfWFYmIrTl48LpcoavJA17kbE9Hes
	 VEa+r2aXfMDt5KTJ2B5CGHIj6BWSQXnyo6oLsL6cHK2UQ3ltQoInxeaDMG9BK6uZKsl4z
	 7k30X2Umol3AtH/RVa2uRY/eDnn1WuagjaKs5CekdQ2DAvXRfzER+fQ7j7MnGFGOEQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mCXumJig;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D50F606A333
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 04:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mCXumJig
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081DC1F00A02;
	Fri, 30 Oct 2026 04:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336073;
	bh=Owkm9qy/SawpQc4aqiI7O5cS4oN2Wgl21fy4+I5xZNk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mCXumJigIbLUTvoFjz2tLa1J4wUVMykSAH0ZgzWeCN5SXaK4iKZDD71akOwoMWh9G
	 attcBPqgtkre3DmZhdZ98AvAUUlbRPE3kFeAFSpjthx08WeVJbEUWuFwut3u8L2hSe
	 hJAr1ENW0qJ2KAUx9SIU0JTfDRP5+6HSyxn5y3FEgg2eHUf7/J5BZKid8N2OWhF+gM
	 Y+0ayE4CD2AnLW144hucgwSUtsYdEQ7ygwDtgvEzaaCdmpUguGd3Lw/lFaBb47hCDj
	 taf9ayu7EiSUJd0g0nlsJ62WpC+IkYmiiYFAf8bmCyh/O9fplQNdIQTj6WKGlSpUOA
	 vuZgVx6PUdWYw==
Message-ID: <sashiko-outbox-190509@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 1/9] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20260915123812.14747-2-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
 <20260915123812.14747-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:32 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Document support for Airoha AN8855 5-port Gigabit Switch.
>=20
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configuring the PHY page.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915123812.1474=
7-1-ansuelsmth@gmail.com?part=3D1

