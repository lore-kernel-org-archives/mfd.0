Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721239;
	b=oULvhHh+CxjhlwRyXQN3i4G/7FPUA4yAS3x3+hIYQ//PZDyERhjEq1yM/ssOhUvaLEqh
	 DyYEIpEVbu4lij/Fq/1kCPBGmI9ieSqY3kRdBpQ9dUsUb3HBCQkBC9PTrCxewexGYpbHI
	 5hOmrV1v/fQV1D4niAa0TglfwutkFxg+8UZtcGg5huEvWHHAPIuZ1S6LGsAaWVztOeObD
	 5UTr7sr5qGbQTJ1CGN0HtDNYmYUxzOSt8HI4sB4qOWwgRmZq9rvxnCnVkaIvUfzBh2Zb/
	 YqUT5QoxVni2hxQDfqApciSGLURzyhqfBgkG5qigybd968hqoJVhCwMjIdQ0WopjICQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721239;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zreHo2ISt+zlnynvOv871jjIeLdVjPJtM/vYuS7vP7U=;
	b=5pWeNhTZKmyrMQgrMszGJf9vu0F2my1kEghc8pSWLYyF5SsAJXo2gwFdvYXfjioUdzbp
	 KGUdS04vbJTe2iKBC6ROwb6IkrVUf7S2bfsO9Ffhp+7oQQD7BX/9aRzNPgcak8nTHaVsQ
	 Jr4Wc/xjHk/I/LJlBO0JpXuo7Wz4xKSCnTe6E5jmZZy6a+kyKEgqA5Z0ixMypWKH9VuMk
	 V2VUNBmVLuoEgds2dvEp1XlUdhktB6fKMiPnXynXBJYF4ULLRoBD/w2zP3sFkAvNhgkXu
	 Iv+7/9Kr4G2A7rXEf0tVvDf0L/P2swCqgrHXcXg7Ohwij3ofeWmRNo6t70tbFdE/Kzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+6uxV+z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1892606A326
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+6uxV+z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506781F000C1;
	Tue,  3 Nov 2026 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793721238;
	bh=zreHo2ISt+zlnynvOv871jjIeLdVjPJtM/vYuS7vP7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U+6uxV+z8jYlke34mjk0did347NDEeEw6mX5do8lYZDbMJdm78OLTT97gH7vbsx/Y
	 pxyAP+CrYcPZGj2d9GwlNT/B0Pb6ZHNcYTd8+/c4pqJmdksFnUX3hCL61M5aeUvSii
	 D8ksAAhY0XNReNF5Q8mhn7BB197DzMswo6Rkw1xKjkPr8xFlkikemM5a5VLlnm6Dqs
	 yf3XPxmsX4TT8lqw/DjXstMy7mXQXb2gpGjYkpGMxB12hSBfBMGrvx1sZhtvuB21d2
	 HxJ9DFUFGnbn6VR/NoXIg8SElXKoejY7tJkucZqfB9ca/I8JvZDadJQYzvmEkXcQiA
	 qpqid5BFAI3Kg==
Message-ID: <sashiko-outbox-195662@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] mfd: stm32-timers: Use
 dmaengine_desc_set_callback()
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, =?utf-8?b?b3BlbiBsaXN0Ok1VTFRJRlVOQ1RJT04gREVW?=
 =?utf-8?b?SUNFUyAoTUZEKQ==?= <mfd@lists.linux.dev>
Cc: lee@kernel.org
In-Reply-To: <20261103155059.1247139-1-Frank.Li@oss.nxp.com>
References: <20261103155059.1247139-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:53:57 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Frank Li <Frank.Li@nxp.com>
>=20
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with a call to the
> dmaengine_desc_set_callback() helper.
>=20
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103155059.1247=
139-1-Frank.Li@oss.nxp.com?part=3D1

