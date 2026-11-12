Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510306;
	b=a6UvrQ4EEAoRAAoc1MCWjSoy3VQ9RZFGw1LJQ4pvQVkwM7H9DH+AHEwX257SJeEfseng
	 uluWzTim3ABLpizltTM7hGyd7OwvE+3mW5qCICDYqfzcWqyZplybm0g7nfcOLa+fdCPbf
	 t34rSlt3/y1VQB/00gyrz4hXF8kwZKy3G3evJIZzIIRDmCXsQN03R/GX4ypRmlU8wFV4O
	 7++3xsuBeYnbBPehQpnNEM03s2i5/Yy4d/d70TImAcC+BK2U85z2pJYISiUF82LWGsAhG
	 Q5OQTpACz5PdM/hnP85J0XZrL+A9yMp/VNuNYnk/3ehQRZuZCN/wwO/F+/jLdZJmZcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510306;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RA0e2QKnDwalWA+R9hmKWyihSWNJpGXF8rFRoWar6J0=;
	b=lRe57DjOEah99wIfJ5bjUH/SS2QyCDolp9G05WO4641OGZKTjRtiB3b0Ew9MfAc0VLRU
	 UQAunMlcBVniMzJZInvR1HDDZwzD46bQFlhQu4cFlMkIGzsWhV1d/Yn7RBwxxv/Pi9Jqs
	 RvVCw29Ouacu6I8+uIHDsdav6kTzc+Nsv9ZO/Z/xsevgPBR+d6h5B4VfGjcHAQ+KfFj6V
	 zfqKl/7qi1i46dlHQlqNnHZMqvoRTzEZqa8gogQAJiNucbdKX/exiA6wGgiVA6eZY5wud
	 y250cyAJb88NnZm8Ts1a3vWhu5A0MkZ0ADt4Qi9EbzY7+3Gr0jILHb/QtsfXzl0KGbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKE20lcV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E82606A31C
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 19:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKE20lcV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F01F1F000C4;
	Thu, 12 Nov 2026 19:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794510306;
	bh=RA0e2QKnDwalWA+R9hmKWyihSWNJpGXF8rFRoWar6J0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HKE20lcVj/sNJg0Xr7qszOWv3loDJ18s9p79h6ZNdqaoDFD3EClu1o7wy0Uw3MOBu
	 GkuLT+pW/vtsTABsQ+5kaH/yd2m6VMCsn2kywrOmaMSWDEDAiWw7hfSg0ZoLvVTtRt
	 mYVwj0Zmb6FYf+IzdCy0YTr6s2/0R+NttMwYoqJDv29FtqPI88JM9NSDj77FJIgYX2
	 a/TYS5XWupWK8qmpQ2UDe/M7Tbm2mTrHG8uHvPowOvt6NFzb6mtvGcKmyiQE8OV3NN
	 4PpSufS5ToVvnQr7qQY10ewl40BkW4eD8QSkX967YcwmMr24JGblKjGkvGZvPQQPCx
	 EaoaWJJ0NeMIw==
Message-ID: <sashiko-outbox-211738@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] pinctrl: airoha: add per pin mode field mux
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261112185941.1316112-3-john@phrozen.org>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-3-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:05:05 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Newer Airoha SoCs select the function of a pin through a mode field in
> a dedicated IOMUX block instead of through function specific bits in
> the chip SCU. The AN7589 has a 4 bit field per pin, eight pins per 32
> bit register. A group can then need one register write per pin, and
> the two entry regmap[] of a function group cannot carry that.
>=20
> Let a function group supply a pin_modes[] array, parallel to the pins
> of the group. When it is set, set_mux writes each mode into the IOMUX
> regmap and then applies the regmap[] entries of the group, so a group
> can combine its pin modes with a register write in the GPIO block.
>=20
> A SoC with an IOMUX describes it in its match data with struct
> airoha_pinctrl_iomux, which holds the width of the mode field. Probe
> then takes the regmap from the airoha,iomux phandle.
>=20
> No functional change for the existing SoCs.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112185941.1316=
112-1-john@phrozen.org?part=3D2

