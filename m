Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585328;
	b=dnL9p/IG9MO+8V5ZDLEzT+3p6G71KdP4cRSnWPxitFY2+B2rW9R4jxChMO81tBwbY2Qa
	 RmeLgbWHNK2edsLp+PvZOaDT2uJdEkg2aY9eCTV6ji6dGlAzKAjUl1ryQnWHJSoh6EnXq
	 orFaY+i+YYXMqLWoun9sqb7emi9GI1BdEprWYPoEsv0pSEYuTS9123FcjgSWjqutguOhu
	 jzK3wOxo7PCppG5jRBYff5w8N96h1Ui+bCQgvpRw9ophVs3MlXoBaxX9WJk1OBxGa4YRP
	 J1tVEvF/8XFszlvMHc0bcq5v1HtN5SBAIXWSV6+AWBM6YZarg5Zy5xNXrbl7zn6JDpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585328;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YKw/Ysr+G8Q/6BP1DIHkestXhJzYg6goHfxy/TqRrYo=;
	b=B/2I8u4Lm11WA1NAcfiS//g7MfsXExNbC2Y8BPJtJI3d3Io2Go9/4N5kBCYm+jzKy63b
	 U+kcwyd1ce7Q7VuM4KMm6ztDPjG8QsZc+PpXm7LV6Ccou+8ckDK2MEcbynD7l8d1FJgXa
	 JX3asz4IeKU+Olc3163JZXgYE3f1/nGO3q/vpj7SPSThVjSSLRnjK5FU20Md42kE+tIVg
	 3YQAx3Uzjx8LX1aaUh6f3fnqrvmCOd6JfzqMDM78eL7VDfZXAKoJVV/sG/y3jW/2R87oJ
	 yQoenf3JJvlEcKHSciutNw906mxe0A9KDn4jk3/3cTdhDwBng5wFWrDYQySRZQ1WAww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhHjXSyT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007A9606A32E
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhHjXSyT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6839F1F000C5;
	Wed, 21 Oct 2026 12:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585327;
	bh=YKw/Ysr+G8Q/6BP1DIHkestXhJzYg6goHfxy/TqRrYo=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=nhHjXSyTBgH2d1S0oJNft46eVe7FIj+MxmpxtbAI0hxbtPFSYPxLtvo2OVKktkoGR
	 CyG1F0F5LViGHH3QI4PKg2923QXC6xcqG8G7c2yBZYWPCi4kbVkwB3k6ER5ESnjoOY
	 9kxF5DxYKEfjqlqOM/hTHv9C5iiGvQO1xz7UE4JWSyaCC89I/uil2w7xZlC4hln/A1
	 HzZVPtYqgLqWRfo4sS5i5sEursuta3k/6d2nnHIdVM8MfEGR01/qz61qbMtwLOxhe8
	 F0UogaahkxEfM1jvWYlrcuQy8dOGK0WDb03jr91+jiNmy6OYbY30PVVTRVTs2ZiSRk
	 4sVWW2W6XBh2w==
Message-ID: <sashiko-outbox-180235@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/28] mfd: loongson-se: Reinitialise completions and
 wait uninterruptibly for commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-17-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-17-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:22:06 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> loongson_se_send_controller_cmd() and loongson_se_send_engine_cmd() wait
> on se->cmd_completion and engine->completion using
> wait_for_completion_interruptible() without reinitialising the
> completion before issuing a new command.  Because the hardware has no
> mechanism to abort an in-flight command once accepted by
> loongson_se_poll(), returning early on a signal leaves the controller or
> engine actively processing the shared command registers and DMA buffers
> in the background, and its subsequent completion interrupt leaves a
> stale completion token that causes the next command to return
> prematurely.
>=20
> Clear any stale pending interrupt status and reinitialise the target
> completion inside loongson_se_poll() while holding se->dev_lock
> immediately before notifying the controller, and wait uninterruptibly
> via wait_for_completion() once loongson_se_poll() confirms the command
> has been accepted by the hardware.
>=20
> Fixes: e551fa3159e3 ("mfd: Add support for Loongson Security Engine chip =
controller")
> Closes: https://sashiko.dev/#/bug/linux-4661fb0d-d936-4168-89cd-2f6dec31a=
7b5
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D17

