Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585338;
	b=tic4FHUPr5wFTU+P6uuF65Qxo3rH36krpZUDPZhlK9VSX+X2MWoAcxxAegrsHWcboqJt
	 YFfotqGiwVs/1svzGVWAvNWUQ8Vje+eMseyNxc6qAId2BXY9qOTZAYc+LssG20Fih5GXZ
	 R8rwwnXQJz2OcB3pujjWdoyZob0+dbNBWF+l/Qu40lR2R9qGSUsqH/MawXJ1oKRYiL8Lq
	 wJvaoRlw/+ueHYcBdSvsC0oOyg3saxiCPNAFaq3PqK+4o25ZAgMNs8HOtnMz4VdoNCH8Y
	 WDHsCPrUiBZpG0jgV6HKbiVIhH5vwQYlTr3lcaoukGT4jvmTp5VVIvjChMZtdHEldNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585338;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/mCwC/pXokdD541R3jYQ8Z0U4WRB0YDsOQzfhAXdSAU=;
	b=2GKTp+FItXfcyg55ReK+NPB2I7GjcfbTlCo+JxHE+SWpn3A3ZEIGOd+uzVRcGlMSllC7
	 EaR1AjUSvMXfYLyULbqkoNIthGlrFmFWXbDGxxJEocKGw0cQJELskT2mcRlmSjVf3GwK5
	 n1J6QcEXR7Nd7j9k9aBssSvV8efRSh8YnpnSxgtxByDwW0wzorKrCZ6kSdWwETDjaCwLE
	 +ujC7nvltNFccqgI+yZB8pJfflk7EStRdgHIiQqEsgSnpm8Es+Q8EDQceEdjDWQ+mEC2Y
	 5Eoz7hl7qC8vqK4uPJny/k+BvcxrMvnwr07352BhZfeI8oQzIDrtYLN8GDxmgetbm8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lqblIShX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898D6606A31A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lqblIShX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4016E1F000C4;
	Wed, 21 Oct 2026 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585338;
	bh=/mCwC/pXokdD541R3jYQ8Z0U4WRB0YDsOQzfhAXdSAU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=lqblIShXyPMiAh1m+msw596akOZo/zwKyDmK+t50MNkxaG+fWR57eJcQHiPJVtwy5
	 0xb4WOtnkUsHkZSDr4vNxDf4LrN9XHmmTZt8eb/APGk8uInEQqGIt8GKDpnwa/LpgH
	 AdB99nHV7DGfd3BGTzHcHQIzjx78k3gqoTkSJ1RmTxFO1wDRlHAeQyEdzzphzeJd5v
	 ylsfgyohpRid1Ci1+zl1win+9m5vwRHugv4BpJ4eb2Bu54wBrNDXX6uvxUH0ETFRip
	 HmjBbTD/ramnvwQwe7u21cReybt7qkbTQqPi51xI7KevGjI5dbNbAbp8sARrc5YkAf
	 8bpKHT18XkGnA==
Message-ID: <sashiko-outbox-180236@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/28] mfd: loongson-se: Prevent out-of-bounds engine
 access in se_irq_handler()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-19-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-19-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:22:17 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> loongson_se_probe() enables all 32 interrupt bits via SE_INT_ALL
> (0xffffffff), and se_irq_handler() uses the set bit index from the
> 32-bit status register directly to index se->engines, which only holds
> SE_ENGINE_MAX (16) entries.  Any interrupt bit asserted at index 16 or
> above triggers an out-of-bounds access on se->engines.
>=20
> Restrict SE_INT_ALL to GENMASK(SE_ENGINE_MAX - 1, 0) and bounds-check
> the bit index against SE_ENGINE_MAX before completing the engine in
> se_irq_handler().
>=20
> Fixes: e551fa3159e3 ("mfd: Add support for Loongson Security Engine chip =
controller")
> Closes: https://sashiko.dev/#/bug/linux-bc962408-5c42-40af-8111-a8463a05c=
cdf
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D19

