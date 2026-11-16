Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869468;
	b=nM2kR3fz5DTM7JhSpRExKlCrqRCOGJPKxY6EuLgmlGMQxVkllNXZLQ+J99NsHAO2ttzH
	 dLXtE7FXguSzN9B7+Xobf4urEG/2DnyT/XVPn2K2+HmjRIWgFCVOg4jVubWFXJs9xcKod
	 8EQpOfud3c2xPf+2+qRyl1qY4Xt/ElFcLy4IFxs+LVTrMt7n7FjRE/c6EaRTQM86o0nRu
	 uOF3P+SJ+zHIj1SitF/M79HXAna9ew600xX2BLzm4+sjAWPkZxFlby18SMVqx8WU24shU
	 w/xik2hP3c2w7/TQshPjGRzNFkfAaxqRGur6yWjpR3ZYGrUBDgFon1gp1kuf6NaKaDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869468;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JXVLR/64aAnQhO7znQw/SJGNp/qilOr4SZBJxFsYxLk=;
	b=kibJehsKt8/TbejEZR8I9lSuzGVNVEbs2awAMtyuTkpmZ5bVIxKBHpu6HnSkyRP1PDFQ
	 ikFQPm6dfAx97hxTBNm33MIp+xK3SEQ+85z1Z3RcV1XPPUjxqlnIq3kN8Mcw0gF8x1JFr
	 N8T+1/0gVqh0gQQhm2skkbhhEYZrBR3c/ZWl7je4lkeblQU6nUpHnRvLAntqfDMRTLgy5
	 Ow9pIJ5AICdA8dtrFlmefdD9JPthpsmzaB9CJHd5QJRvbDv1A2NTyhVNCTH/Ml+EifXDI
	 RT1MxntDJaxD5zuN0kY6yXMChzLQbpvO6wjHGELzpU2vlnzOulg92ZCNPYOhwM2SbLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UyqDHP7M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C144606A323
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 22:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UyqDHP7M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B6D1F000C4;
	Mon, 16 Nov 2026 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794869468;
	bh=JXVLR/64aAnQhO7znQw/SJGNp/qilOr4SZBJxFsYxLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UyqDHP7MUccZbp0/d85xIqlO6omWWTPSORB2V6tUHe7TXWRJrqRSLGY28xf5kCjCe
	 dPGqHD0NfrrV03EiXK7dQoq2Q32/eKwMRDamvkihxEXlKgyoRex1lvrzvgcggfoHrQ
	 4h0EqSUKufk9V+wJvY6CWy7tieqznskIYeeP0zdcaOpXfZtYBSKqBjCIslfwfLtVQQ
	 uWL3TetYazRTMudopEcE7nze0crnZJH1B2PADFeznZ9UYcVpAmptWeNXxqPMh/L7Qh
	 k43Ueeh3STxFbVHdacZEACjMEBRb0/0I1Ov2EBjpnLbRkq7zn5EcYrJ5XnC6hHXb9S
	 dxgB3TxUP5Kiw==
Message-ID: <sashiko-outbox-217817@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] mfd: mxs-lradc: Convert to
 devm_clk_get_enabled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116224803.61154-4-festevam@gmail.com>
References: <20261116224803.61154-1-festevam@gmail.com>
 <20261116224803.61154-4-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:51:07 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The LRADC clock is acquired with a managed helper but enabled and
> disabled manually.
>=20
> Acquire the LRADC clock with devm_clk_get_enabled() instead of a bare
> devm_clk_get() followed by a manual clk_prepare_enable(), so it is
> prepared/enabled for the device lifetime and released on unbind.
>=20
> This conversion makes the code simpler.
>=20
> Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116224803.6115=
4-1-festevam@gmail.com?part=3D4

