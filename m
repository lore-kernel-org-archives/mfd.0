Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F1A305699;
	Tue, 14 Jul 2026 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050155; cv=none; b=lpZDwwrSMb2QzdGSeYhIxT7LK3bMXksRu/5S6mmA/36Q3vDY9nn6A+dDZKnP0CIkP+h8OV3n1sh+K6mXTywLvE/Hs0VntA73hUPLkVzZmHvSb9mEWnqlX6n2wBhuxzp/wzHtGZ8CtYUgvCZdb3d4tdGK4hgN5YNNYz+Pr0WzrR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050155; c=relaxed/simple;
	bh=uR6/XkD+CwTHmnTGQD7oqVmblurZg3sLVqToKolaXbY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eklNkFQQ+hvp0qFFkOXEboVQqOs1vnuQaPIphiAK84r9fugd8SlQBqMLY4kK6pELFSd7m2aroj+/uj/GPO4TFhzNXBP7a2UXvvPM8xKu/GQUoT9WIEHxxKBX+xIblis7HMmO5AkwPsg14x3uLFXaf9GwY6WyrP/eUYc2mr4L1nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DofBqUbr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DofBqUbr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7965B1F000E9;
	Tue, 14 Jul 2026 17:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050153;
	bh=uR6/XkD+CwTHmnTGQD7oqVmblurZg3sLVqToKolaXbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DofBqUbrwYSsvGrBQHlRMHwt2bxEObgErKopt4TOVOeLIaMdnDXIxC6p5c/bvLQgf
	 TcGB4P0fsuzqlzRWryqXWIAuKe1rCPrmYXYYHGDkhgV8qpfzwBCauIKq+IXrWW9nox
	 i1ypyHzoXMQCU4N19B3gG/ZSsDUGOvzSS4XM6g8qiD8+e1LPkTv22+R+lERtdgp3Yj
	 szvs9snmIse/ApUJK8YuXPe3yjsSsjbza1ArKdIY6BNrRi4+pIMdWjPrNrmYF5MeBH
	 W6vrTVBafJk839v4iJYQKbsZw0LO8qyJ3DPmS1tiuNN/IAxrKqBpe19+VGNOSW6ZEk
	 obbFYkbkm611w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 01/13] power: reset: reboot-mode: Remove devres
 based allocations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 17:29:13 +0000
Message-Id: <20260714172913.7965B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Devres APIs are intended for use in drivers, where the managed lifetime
> of resources is tied directly to the driver attach/detach cycle. In
> shared subsystem code, there is no guarantee that the subsystem
> functions will only be called after a driver has been attached, nor that
> they will not be referenced after the managed resources have been
> released during driver detach.
>=20
> To ensure correct lifetime handling, avoid using devres-based
> allocations in the reboot-mode and explicitly handle allocation and
> cleanup of resources.
>=20
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-arm-psci-s=
ystem_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com?part=3D1

