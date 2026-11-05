Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877306;
	b=ulJ0CZO/4qHeSRJqJp29HGVa28088r1ZpdYGDsbVqaNu2ojd6GgZs+cd7hAHf8rcIdcu
	 S1zYOxAQqmLk/Blv/9k2AEufewRkRA7Qnf7VnsaO6Hh1gUkMEgw0OTt/qgQokgnbQ3o+q
	 QuVdIF5A5yGwOR6F5a7ZeS346NrgXzjS+eM8PCDEog9wub3qTZSIa2FAQaSCW4MqTOZ3j
	 D7Z+eiiA9YXW1IYNr99mQfGfFjrRQL59As4Cqij8xKc/WuMYIN1HCvI4IrMRKRXBcZ2oW
	 erecExM+Fy+/OkZf9uBg3j2fYgmZ0tWmy8OpVCTSBogg0cG9pLJ8TxFUJUII1m+wuBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877306;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3CPhC3vTTxr4dWXw/s8Mq5xwSc7oqRK0QNEH2vh3z34=;
	b=4olLT6UA7ohvdRkbRUDf69tD1G/Z1HwLOUDu6TMraicep4JooDuFDfSOOL7UY+mVKs4r
	 DphYfzKGTi4kCv6GC5KcF8Go17t8CcuSQipcXCWudqAOE4YJQ3tGejPdAnBKhQr0o60Mh
	 dC8QTfPVrCWVDDYTrJtX5uNWE/ygW9wyK+eWyJl26SdaCyk/uLlMsIyKSdxC8PT9SQT+v
	 rInJ9F189cRX3ZTOWHTIqNLt8Iwl8IHq4+L1EtyJXi7qBwdjWDZsMrBzSsH8U87F+Nejd
	 tq13/TyjeBf1tJd0nM1EgkQh/5fBDEERCeF5AmjGnODzQooO+B9M+ZYNYbjjs0QXPyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9K8mHCV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E858606A326
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 11:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9K8mHCV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9241F000C1;
	Thu,  5 Nov 2026 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877306;
	bh=3CPhC3vTTxr4dWXw/s8Mq5xwSc7oqRK0QNEH2vh3z34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L9K8mHCVh4kAouDoGwnk0YERWBM8PyBmxb53ukJR1tTxiljkPH+yRwa2u4xdGhTep
	 cbbZfa43qh4MhYLQSy19UbNIEadVmb1zR6bC8da9gK08dfmvxg9YUT1eEIcU/XBlMv
	 gqDoUhvW/qG+DW6fPsHsycxDa9JjJLDR40vVnz+bC0R+VbokM8a1ov5IMD2oluTOvc
	 JYjx4mF2YEAqxTH417+I459SINpK1Dpef69auOjUM+1ncl6/TDc4YxTp85pRK9b7bL
	 RX2n571cFm/zzJL3P32UU6wQI71xUpjVDhyuSYMtB4Q+l9WxVxgJ/ufjSp1Ixu/es6
	 meVmW79judB+A==
Message-ID: <sashiko-outbox-198929@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: mfd: syscon: Add Qualcomm Nord
 Titan CAM_TOP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261105-ccu-v1-1-3accc4b901de@oss.qualcomm.com>
References: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
 <20261105-ccu-v1-1-3accc4b901de@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:15:05 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The CAM_TOP block in the Nord Titan camera subsystem contains
> registers shared by several camera blocks, including the CCU output
> mux used to route the CCI I2C ports.
>=20
> The block is outside of the CCI and CAMSS register ranges, so describe
> it as a syscon for its users to reference.
>=20
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-ccu-v1-0-3=
accc4b901de@oss.qualcomm.com?part=3D1

