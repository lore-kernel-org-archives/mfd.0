Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122741;
	b=FkrVGkahaEVhu1zFZJ7JgKQUeS3hr/6ZUjmkcwZ5WpxKCc5DKPGA+S3eMj1ztDmTsYMT
	 pMm0UABLXszwI/ZdQHlBCT9f9VkmcmiTm0gPR2OM8Un8XKGjk2/ntDfQ8F37uY5LDGpYK
	 Kssd+wkoQuHd8OLKJsk5Y77yRDZWqCyQRPlFxTFSP3BPd/OFZvDxBSSoRmDlMXhxZjdqM
	 XqalLMj2fylwoAYf71iZn8CrgaDRxpgzde0Su75nv6pyjHKWGjIWKi6TK6to/GUYYKpb3
	 5BemGW+7SYAAORgawQ16IIloB7lEs1PYNVU4nLnGWdH/t381RdCUpbS565iIXyqcRfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122741;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=POsH2thDCd0sILLI+CeCCzD9Swd8Tfw2O0iZBkEkjkY=;
	b=GJEsOxYJbUttFyYluAyb1CLJtKHS4cLRHtOjmHpd77aPZh/PSu8XP/3ZqwoLKaCea+pe
	 NfZLeqWqzuQ+/51g27n3afE07IMiVHirlDLW65Go7ZLYCF7dXsJEvbUmvdyJP2xAelkm1
	 Z3cuBxnQJtpZu4ERIz0xYHCIXxh/cX5WuZZ9P0bRzIUF2V1Ld8EA6U6oTm697ZQYBfL0v
	 IbogWxjMQip2HPac0HSmf3McDO8KiHAPhAIJ2pxVY4A4+j11HLAQxSMic7RNfsXiWAfuh
	 Gy+7ViI7eQLKsVchxG7J4f9oh5xitERVFzFHSvmpgcekGZ8gAzxAj0lz9H+bN7ItBTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jDZZ1CnE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136FE606A337
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 07:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jDZZ1CnE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54851F008A4;
	Sun,  8 Nov 2026 07:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794122740;
	bh=POsH2thDCd0sILLI+CeCCzD9Swd8Tfw2O0iZBkEkjkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jDZZ1CnE2f7/qLx7ve26vbbcORIkAmMLGsHpB5nk/rS+6LjPL0z7Jp5/iiZZz8X9R
	 +kfAFeiPSUWjWcvsHPccFrdDpt6iPLBiFh3lTmRZPHleaSELNtxZQwAn5clBiXdtFp
	 l7qY7rGE9B3gF3u3oSn6VgmgUWwv8+WdV6t3LUlo/GVjTvRF4cWbfGQft7y7CTE0D3
	 Ll6TkWBtjXhFhv+aPacF6/IYbNmh1zEe5kMBqjwDKA0Rd5hP54JfnDnb2+D/b8BK63
	 O6nXVxKFS5rgNT8odENXJ2RnXu1ZItKIFiNAW0SEc/0IAd5zMs/DErT7651vEFyHl7
	 1ywea5SiulkHg==
Message-ID: <sashiko-outbox-203618@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mfd: gateworks-gsc: Propagate I2C write errors
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261108151848195Kkf_f5Vk8ogj7VbdDltdH@zte.com.cn>
References: <20261108151842879F_ON2AUBnuh5imOx8oZ1w@zte.com.cn>
 <20261108151848195Kkf_f5Vk8ogj7VbdDltdH@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 07:25:40 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>=20
> gsc_write() retries the I2C transfer but then returns 0 unconditionally,
> so regmap_write() and regmap_bulk_write() never report an error even when
> all attempts failed.  Callers such as gsc_powerdown() check the return
> value, but those checks can never trigger.
>=20
> Return the result of the last transfer.
>=20
> Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108151842879F_=
ON2AUBnuh5imOx8oZ1w@zte.com.cn?part=3D1

