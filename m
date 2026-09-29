Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F6E568552;
	Tue, 29 Sep 2026 19:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711555; cv=none; b=MvGRSqxlaBTqvwfw7hYd6vLEbgEiJSwk0MDLGOPNosAH3ukd3EaL8irjVdSuCJuJzsS7bq/hcrBtJHac+VRGo7LiLr9LwTzabdwyXFmH9oW8dga0CnBQm/cWkVPLSamYBKWf8oA3kVS2YVPT3jvGixOS5lLcVNIB+AY2SSyrTkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711555; c=relaxed/simple;
	bh=lfVbAva6tt/e8c8CbvKfF/cIoFP6zgvEIOyj4DLtLOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pzqb8S5c0ISdLEVwlvpJRpyaFrfcLCcJ71fUfWCOIOncq4N8PV7Hjj+qpYGv8FXbJcW0kzTweeu9xG2wZKhJbWk8HmdC9YJ5LKDZEgnTuxBxQ2y65i1hEJkMRv/5Dt0j3BLZV1Kyr2v7HbpzfIOLU21aYzWdFgrSsQQ5sdthUYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X03eSXba; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X03eSXba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A8D1F000FF;
	Tue, 29 Sep 2026 19:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711554;
	bh=lfVbAva6tt/e8c8CbvKfF/cIoFP6zgvEIOyj4DLtLOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X03eSXbaG9jK3TfM/MLLm8tEMuXa9Q4j7X+KpnAgAWTyGlg2YyAVMzZmEzUfqDYJ3
	 +8iEVRXuVvql1gggYJF+jChXmwTNl767HrNy926ODUyeIaUkuIJuR9VhYpkZl6I3Dd
	 sUwt19W0mfOJmOspmyZ/KelDNPF62+KW/W9KYODjAk4fOE0Bz9kPfUsWvV412kPAqm
	 jyiwqtzTicsccwdqRLkd/KcDHCLiIZckfGu0sdLsHp5JB35iq6ooGKUkDftrQGDATb
	 2r1w364LouXdaAT/ZOwe2fMcKMEwNIu3hKRywopxDGJ1Cu5HYmobzYbUDw6NwBpyy5
	 WqIeFCNxhRj2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v24 08/10] net: dsa: move mediatek DSA driver
 in dedicated directory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928194511.41878-9-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
 <20260928194511.41878-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:52:33 +0000
Message-Id: <20260929195233.E6A8D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> To tidy things up and better organize DSA drivers, move the Mediatek
> related driver to the dedicated Vendor directory.
>=20
> MAINTAINERS file is updated accordingly to reference the new location.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928194511.4187=
8-1-ansuelsmth@gmail.com?part=3D8

