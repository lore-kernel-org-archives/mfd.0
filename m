Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369160;
	b=HWUbfL2m5dQKOtgPGSB/u0e6QMANZefjvNv1oPYONcDv3VNOayj0eDmqY0Cjk/gH8kpO
	 dP3BR6Ng6nZ4eXMwBzldH8QzV/tUIqOjVZlAh8d0Zf01wYUF3CglDurc7vbXbrZVbOoKd
	 baM4Bz1Fo04O/R5LCNv5eOS/cTyTqRO/fnZVt+jrPnzuh2+9caBA+CKE4PxFbcNbK4mFt
	 eZPvGbybtXcALk7tI+USHITtbl/ervKVl+qnSt9TRWTPewF925R1PLzezWCwKncEtURWO
	 uIl0Ar4ePVnIqZyyx12NJpf/NBbTI6SLLRUNE3YjqemYBenrWXl4WalbucyMszit09Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369160;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dsnz4tVRbENQZpcPKdizy3oZjDqDi6BzDrkZuRPke4A=;
	b=qxbwSUYxurXlII8Kp9i3Yjc7yNzJeW5J5/AfdLkQrZ8PZVqydUCuz8uWC1FvJxZhwmo6
	 toXdKKuRrtEla7sMe8wx3CpAltPME9AGgtU085re6i9034w6IRAZqgbH3Mdqsan++wv5l
	 u47XkFrPJowXZKsYM48eJEPvBJg2hlFTAbRhgqy8KNjw7/FC1eMe997/CM3xSTxKfPmEv
	 rmqGj9yaj1W7YubhilPrJwzYAzwMLeXaQ4Las8bf/OKAn4X2DYZWVsiITcn9FTyvBkAJX
	 4ucKeF7fbvbIvqQlASr6OKYmBfWlVj8B+GJhUqlN+bIOxo+vMa1Dh2h6w1A9q457UWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOgtQ4Ka;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E0A606A31C
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOgtQ4Ka
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443211F0093A;
	Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793369159;
	bh=dsnz4tVRbENQZpcPKdizy3oZjDqDi6BzDrkZuRPke4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QOgtQ4KaUtROMV9bfmDGoXMfnBsnr8pL+e3dRcvIU03K9ZtEBOfD38/YeJ3aoYdY7
	 h1RkKrshzpKHQR3I1wdjXcFbgRUf1hk9XvCBcgwQ2q8ulGOLZoMh7jdqtmdcuaaQTF
	 7mtY8mDWsGzOUl6sYKZkPpVMdcxxkRRZKByzsahBLKxLdR0XfU/BnCO5bkwdi4WJb8
	 ygoPXVpbhwe1JBVPttbOWUSk/ijY8W7CNO0fUMDI7YTrTeuWfoeWuvFJPKpAbIA97b
	 A3PVTC6SrG0CkHArp2C2qYdm+uJLZaftVtGgl7Zpr7f9FY8+50yz6JrbgMP45A3xyq
	 nnuzuJiFzmFxg==
Message-ID: <sashiko-outbox-191089@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] mfd: cgbc: Allow compile testing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261030140240.211786-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261030140240.211786-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 14:05:58 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> cgbc-core.c driver does not use any X86-specific headers, so looks like
> it can be build tested everywhere for increased build coverage.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Reviewed-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030140240.2117=
86-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D2

