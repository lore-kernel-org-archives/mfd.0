Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272807;
	b=YUfYKJGWn/73BIZyb/l4fcaXlYrl1AWx5Kys3AfnqWF70UqbXPDLO5C+X6VAlffLf+fc
	 UkVNLJUEYgvDBPzEgfZkajIp32bFxcZS8nVUKxH/zqWQ+cQRbGEkkGcwHy9xi8XmZeQX3
	 zxXjXEUwhwlUgKd0OID9tbBlVIZ3tKc/DUqdFlGgrJJIbZQza6oCQse2z+7Hm14MqWxTv
	 YpAni8/PxxOWD55XbgOzMk24Wb6StMUWtjoBfjkD8dxuQxlA/U5QYYPwmCtrd68g3LWTs
	 mAK4fZNQwfImj/HWROxMtyRN4bU3LBqmZ6reHTchYdURG1gjODCIm11U3yjo7Ng+rcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272807;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=quGPJwHwMjmtOjA8STLZX+vrBYULCWohfA/rHbAVEYk=;
	b=iKByI/YVK791a1WuhjOMsYoJO+BsolzQ1t4Kxme+o7zwMqUVJuHJ09cZRe+yjABV1Qyf
	 WBOVaQcV8/b0hqVqf1NQXbMONvvMWF+NCcobc1RXiGz7lda0ysMKZhTAc2jBpDzVLgNsC
	 LUZqCTJnXK/24Gc5D+LKjhIxc1jOu4fjG5VIKxkMegveSjvVJdyojpfD+s5B+737HUyzF
	 YAJChqL0QEvv/coYSdA0MPcppRjsVV5P3P6p3zAW4WphLBYkCLa1n/iBJhQp2dUAxaPcx
	 BrSoR1/kZPGrskzO2ckojuYlg2lb4M0yfmzmSFUzNM+yE10vZE7aF/fhgzqOuOa8I6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WczTAn2F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDF1606A32C
	for <mfd@lists.linux.dev>; Sat, 21 Nov 2026 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WczTAn2F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF5B1F000C0;
	Sat, 21 Nov 2026 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795272807;
	bh=quGPJwHwMjmtOjA8STLZX+vrBYULCWohfA/rHbAVEYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WczTAn2FsDYcM+gCtVXNmmNkttRA9t0N4a78Jsh4YEViYWlovdsIDfpNGPY4JTT6q
	 Ho2Ffz1+psEjgOqT/HaHJ77U+u4QRDsK3pfQjFjWbaCSIjGH5XWuezB8UE9+T2w0sZ
	 rtotGdyZrP3w2zOcxxq07huw03d1knVyirJXAVnC8gCk/APAYPXda3KXld2bdaARvy
	 w/YyvgSskUb1ZVXGRnMqLOUh1VRMkJ4WCzyYMJtrNiYAo7qkuGLQ0ciy2dteDvLyNX
	 q0S4e3oqRuB68mkIE/ZjfRe5nBBJGvcrLkNqDOb5ZKdmD17PUfWYa4srUMyInqpNih
	 dhj6g//g1PRhg==
Message-ID: <sashiko-outbox-227114@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 0/9] net: dsa: Add support for SoC-e
 Ethernet switch IP cores
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
References: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 14:53:26 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has finished reviewing this 9-patch series:

- Patches 1 and 6-9: no issues found.
- Patch 2 ("dt-bindings: net: Add SoC-e SWIP MDIO controller"): 1
  potential issue (1 Medium)
- Patch 3 ("dt-bindings: net: dsa: Add SoC-e SWIP switch function"): 1
  potential issue (1 Low)
- Patch 4 ("dt-bindings: mfd: Add SoC-e SWIP parent"): 1 potential issue
  (1 Medium)
- Patch 5 ("net: dsa: Add tag handling for SoC-e switches"): 1 potential
  issue (1 Medium)

Detailed reviews have been sent as separate replies to patches 2-5.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-devel-vstr=
assheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de
