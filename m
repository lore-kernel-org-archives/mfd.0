Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379602;
	b=bno/1YDk4xkKlFjUOPR8N6hXFI49Cx3i7Rkwrkcx15/94E1+VCrEE3qFjCEme0bo5+6F
	 pY8KVjRGv5HYUj1jx+0xKjPzppMDGw/mYTRPbQCEHp5v9SfBY9QfQBSJybHDxXUHaapPB
	 j435/OIj+EWnKrkPEmVAFA39Nb1qV/Hl3Aa9/xdVg3aA2OwliRrKBjpHJK8cUWTGOtXEi
	 6bGNT0fNK9QfrBEWxJttsTKZlW6Hsz3FwdaM6mprw/4pgHbVSDljmv4XT2waZXJUGS67H
	 pYOjSLWEsx8I38SC6tdsGBlWr/oUQl/ay1R1RgPARBtRC8DREXQOI1QbfKrcIkg9vKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379602;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s8baPY5+yjgO3nvtjvFE8OpuE3Vbngsh8ZdOj/k7o9g=;
	b=UChfiI8BO4wy5tHQ5qZFccWGkkA+P6L7TeNRt5XmKC+awpxZZzrAVydvkvy96UTxr4oz
	 1MNLNc8isYEXGyvoJChrtSiglmGH0VuV4P7CWwmuKKgFQT+QTW0wLbINfYhseQGRQCVmE
	 y5nJ/0Uom7d2QAzavDLb/S+RTudVp69GZJLdO1uMU/ZqG3tcV5owrqkhPWx2YftuvwN3q
	 6jJj74TNc/o0EQwN/e1IYfcR4ErAdYjWq6mafTbDQiNuAyiPDFcRo7iYs7rNtLnwbW0Ju
	 Is3pfrYCa5HUHzeQDxRNXqI/fZ877Pgt1v/1CJN4He1S33CbKlfHk4b7PPzHdxEZKZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nKosrlmk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C71606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nKosrlmk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22B31F000C1;
	Fri, 30 Oct 2026 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793379601;
	bh=s8baPY5+yjgO3nvtjvFE8OpuE3Vbngsh8ZdOj/k7o9g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nKosrlmkxXswWYECohYhuesBxau2KafZz6JFjlJ8rP7f8Fb4/kHjnrlhwvTZg05KA
	 xKniYeBPSpHtIEs2OOS3lrErmDk05MQPepoqSUX0HvGxqGzsVIggMtbOzDO/A4nC6M
	 jYYEWIvZqZA0QR3ANVWpvQfcW2HWXqvyRgR1ISEHRJdzWtO+YoZ7gErtp2Z9iEnWVE
	 P1K2r+yF9QncDnO5xEFrDO6oZziAGOQdTW8yYCvD8ZM9VIEyYRPIL1XiRkTiakKEgP
	 3/zsVNwhsgNEpnuLQnEJ+oYZnXpII0B2VYdHxe8CWio9qxBvD3esdLDmi+HkmWgS76
	 1pMmJx2HV8Udg==
Message-ID: <sashiko-outbox-191296@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] mfd: palmas: Fix potential IRQ action leaks on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <fe4ee2ff4b3ad6675a46a169d6de6410db32b652.1793377422.git.liguangshuo@mail.sdu.edu.cn>
References: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
 <fe4ee2ff4b3ad6675a46a169d6de6410db32b652.1793377422.git.liguangshuo@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 16:59:59 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The remove callback deletes the IRQ chip before managed OF children
> are removed. Their later free_irq() calls cannot find the disposed IRQ
> descriptors, potentially leaking interrupt actions. Depopulate the
> children before deleting the IRQ chip and auxiliary I2C clients.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: 124e9deb1c40 ("mfd: palmas: Use devm_of_platform_populate()")
> Cc: stable@vger.kernel.org
> Assisted-by: OpenAI:gpt-6-astra
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793377422.mf=
d.git.liguangshuo@mail.sdu.edu.cn?part=3D3

