Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACF9494816;
	Mon, 14 Sep 2026 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398577; cv=none; b=UQMIRPJdpv1CH1NOHmzHJlTPsJCrP87GrkH5a+nqx5cA2uwFtK0hOwW8M/OScheXzjhcESVb6Fe32lGfNFheCtY58uUQ07Qx0I78vwsbVOEOu922tBJHtPNPqsKPH+Yr36VWoME90fyjOTMy/mdJLhhppUTGjfGDzc7Mlf+9qUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398577; c=relaxed/simple;
	bh=xcLjwts0ufzdL0RMrUz73AkosnbXV+NR95xz/WUl3d0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R9HHyFI9Vhow4Rx7OR7y5wFUj80Q9Yqi/qdJMKQp8HExsy/vrOL5jO5mNxi8rYYV3YgwyB+ukFWet3OcErk82S+muTJjmmUlYoMsBVa98TF7cPHbd/YxvZH64Jq9VV2ufCMLYEAJ5O99IUxSSRUQKnPm9HkaAe1xiPcbmhD1UYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f25tKUag; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f25tKUag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE391F00898;
	Mon, 14 Sep 2026 15:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398575;
	bh=xcLjwts0ufzdL0RMrUz73AkosnbXV+NR95xz/WUl3d0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f25tKUagTEsrXvfbG5HiJke+Nq/WTg4OFSYkQM2yMAl4kXnn3EZ2yv9wRVqs9JjhG
	 5dkhgpMn70zdGLTB6TP6+3Vx7Gw6MU1F483vlxShoRkcNZDJqcuMx875e1PASL6BMK
	 9y/p1+ni8rqVcQaNyDq2I0QlMHVHYtj/FTE94NOlU2+x1E2WIjK29L4VdlJXHjP5oj
	 zy/y7Vyv4h2MWUI6lxU355EUP8x2FrmnaIqptW3pxfeLYqwH8sXi8GvOmlSlCHbxVj
	 +MPTz5Jh2wYAfbMYD4U33kAk9QsSZ+qGJLDjEunC656OwzaPHmriRM2j4Pz8IMwtYu
	 NzHY4A5TFeQQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 01/10] power: reset: reboot-mode: Support up to 3
 magic values per mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-1-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-1-4aaf5c09b5c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:09:34 +0000
Message-Id: <20260914150935.0DE391F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
> cookie as arguments. This cannot be implemented via the reboot-mode
> framework, which supports a single 32-bit argument as magic value.
>=20
> Extend the reboot-mode framework to support up to three 32-bit arguments
> as magic, per reboot-mode.
>=20
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-arm-psci-s=
ystem_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com?part=3D1

