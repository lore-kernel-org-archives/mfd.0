Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428703;
	b=29OOLwk0YKNKWC5UTKLrJGNRwiEnW9L6o9rCE8bAVSAgxicD22MnMYvo6sgfCy79IHic
	 Zht/Rqeg6z4HANrpTcwSzjK1/4orC3BJOkMJMe1sGozKeglg2E+AZbD7B9+mV2BN8QxKZ
	 8sDN53RiHohPMBl+snHZcnzpMj4vZRqDnmaW+4qN0tbIF0wG5jJxiCWrfrLoKxs2P68rx
	 wK4lpg2eYYVjaezvMTgfRrFm/2Xbza7h9whzJ1VNRYDysl4yIu7kCG6bUUTwpfvpYkNzj
	 W/jlYMADMaPUfIBdzlsmhML/Fk9eTZU5Hd+AwR9XzCvMLviMDzpE0mHwwq4OMQyp8cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428703;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s0Tp2ls7xq6BVAB/ut4XeXT+lq7nvDHuQn3tDvJLBLw=;
	b=Zf8gjmicRpp3NnRTSK8MLCMNU2kIaJiZA79SJzKXDG3IeREekxL96KJu8cdY4HN1hZHQ
	 x3pSEd+jOxi/eXT1J+WRBLyrynyzE5VaFA/br79gO+XiLlswLo8nch4C+bhFjX3Ce0BuU
	 jAkCc/tUCxc6WyC2GrGE3HuJ8HSJ5N9M7TSg0O+o7DRNcK3lPF4Z7pPmnZtXItKS/M1NK
	 Itb+DY/Jj1NO5oYSeNputl2wxBkUyejfSmA/sX+6X5KxriZwijF5sfnjIj9uz6Rmyxi/s
	 878o64z2F6FylP8GZ1UTCDvYvnpiqBhwXSrTpNLZdlD7v9Ug2M45dqULCCw0G4LjtHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VyFOE2Eq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B48C606A321;
	Wed, 11 Nov 2026 20:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VyFOE2Eq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4801F00A05;
	Wed, 11 Nov 2026 20:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428702;
	bh=s0Tp2ls7xq6BVAB/ut4XeXT+lq7nvDHuQn3tDvJLBLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VyFOE2EqCFE0eSO60szeYdYKN+M4f8jSerMvkjzzgnFJJ0YCnr+eRzI+y6rreP09I
	 yEgbVR+IVa9FuxeUjRFznYksUu3bHpStS4Da0L/E/uFpTwCgYSy4oqMdLuIH61583P
	 9hYsni/whT54SrXAOfnL4h8syZLDXbM9IostP7j8BfNcnP+gK4sFJUjkWbJdLWYrzi
	 fKAka1TVumFIEdRWWRVqXsMXqyX+ji1dTp7QgJyu5OS75POQ+AoqMXjipRizrQoagQ
	 hxTWmZNtVNllWQ3a0CWbGvkZRisyLkwXtWukfIucn9RSFDjyzXZ3Bt5uNt3ti6WT0E
	 9lLGizAOWYwlA==
Message-ID: <sashiko-outbox-209650@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/12] arm64: dts: hisilicon: hi3798cv200: pinctrl node
 fixes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261111-dtbs-hisi-v1-6-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
 <20261111-dtbs-hisi-v1-6-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:25:02 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: hisilicon: missing Fixes trailer for commit
  bb61c53601b4
--

commit c07dedfc429c6da43eece5f84e24871058585f28
Author: Rob Herring (Arm) <robh@kernel.org>

> arm64: dts: hisilicon: hi3798cv200: pinctrl node fixes
>
> Rename the Poplar pinconf node to pinctrl and correct the gpio9
> gpio-ranges tuple.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

[Severity: Low]
Both the pinconf@8a21000 node name and the malformed second tuple in gpio9
gpio-ranges were introduced by commit bb61c53601b4 ("arm64: dts: hi3798cv20=
0:
enable emmc support for poplar board").  Should this include a Fixes tag?

  Fixes: bb61c53601b4 ("arm64: dts: hi3798cv200: enable emmc support for po=
plar board")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-hisi-=
v1-0-6c9f5f80716c@kernel.org?part=3D6
