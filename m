Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993793;
	b=WMI2/cJQIF1BvzKyVAAPOqBfvBb9P0sJmB4rj84D2t/u0X485FNayGMy0XhQVC5wv8L/
	 a9GspODyK8J+aQ2e1ob9amchSBGu07mlTnyA41e/u6UjGCHecuo4uDzP3a90yIwgpmFEW
	 QU3Q3hzIus10jy3JIMuSk8/zGZ9MdhyJPDQVjdfGqXdnJLu3t3fS0DsDMscfl0ShRIBrV
	 53Nhl7PFpC3wVaqsvtdVTefF95x2KVVXj9eqo+04mC1s0al/xO7OuzAqGuD39vfLRTCul
	 mpngS4cZkQwQSZgQ/WzaCxzFqeOi8BRvOduW55krmXuxzuY1dE53Twz7RSRRsNJiuZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993793;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n32JytrswhUCW2tCsyrLc/BqXOGMy3gM8ly6N3h9MTQ=;
	b=kmzOHhmkag7KUS9f2j2wxW7s141ERioXgeTwF12/rYLTRLSeGBRiQV46q0wQH7+/Bd/P
	 2TMyEeYTHLfa++ncbC7JQTvZFvJzePyP+4NlRWotIw8xKxMnfSjGZiDndFB1vAID5OYAP
	 AMslhxHuiBqyWJ+/duvNEuh/2VpSJsM4OzpSmRZS/4UMlEGBA9PX1QJ+GQd4VUvdyu+h6
	 1zSZ00w8R/2w0Z26Hz8CKTaEDGJ4QA309mOmYWEbO+jnPfgBBGGPxiovA7kBjBkaqJAzm
	 5gABiZvT60tciMpD2E0g5oIkfEs5uWsajmw+14iOutE1eqiBa1txVdrOzPH9hdlgPVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dzrE8koe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FAE606D808
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 19:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dzrE8koe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57C81F008A4;
	Fri,  6 Nov 2026 19:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793993793;
	bh=n32JytrswhUCW2tCsyrLc/BqXOGMy3gM8ly6N3h9MTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dzrE8koe/5OMZEcWB6qRMxaG5KQTrsb9anHqhmQDtfohbwVxzle//4uwrekfjz6ET
	 BdrB/1ddnW394v9r/r+Hkdq6oZwBzdAW45KPGJuIjn0Tgom0OAhxR51n5G2vj8dY/C
	 UDHg5LSZ067+QFAyGNI+LPvQnlEqR6NkJcUOt34N6hyfAaqV8ovGaUr1rgGcG2N8hY
	 4R5bYoNkVg6URpKPfq432vOE3zAHriiMVzwmskJ5v4KX3aq6qYbYpgP3ztpKW2FoGZ
	 wX4sshmBAg1c2+Czjd1wBvvjhw/N2H2QLHgTutcoyfodMuvfLFDYB2ceBzGJfiUL94
	 JndYMPrWmhacg==
Message-ID: <sashiko-outbox-202156@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] mfd: cros_ec: load cros_ec_pwrmon on supported
 ECs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Balint" <dbalint@google.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261106193129.43493-4-dbalint@google.com>
References: <20261106193129.43493-1-dbalint@google.com>
 <20261106193129.43493-4-dbalint@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 19:36:32 +0000
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
- [Low] mfd: cros_ec: lowercase description in commit subject
--

commit 9d3435eb48d0511f2f3d3ec653ce62f525f2879e
Author: Daniel Balint <dbalint@google.com>

mfd: cros_ec: load cros_ec_pwrmon on supported ECs

This commit registers the cros-ec-pwrmon MFD cell when the ChromeOS EC
advertises EC_FEATURE_PWRMON.

> mfd: cros_ec: load cros_ec_pwrmon on supported ECs

[Severity: Low]
This isn't a bug, but MFD commit subjects capitalize the description after
the prefix ("mfd: cros_ec: Load cros_ec_pwrmon on supported ECs").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106193129.4349=
3-1-dbalint@google.com?part=3D3
