Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40A63403F2
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 14:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569857; cv=none; b=jhwaL2xZODNs8XD5tzR3YW4nW6ybJGq/RZR0+wRnBjysmNg9wS2Ciw8UixuJwoXsLetXiM46O/pibaU6sWQs9z1XKA0gIyBJ3OU+3W7bJ/jxhtcecgKtG55pS58D8sY1EO4k3Q10mnKCA8NY92gwqX+CCp4QOguJGFy96fx8rzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569857; c=relaxed/simple;
	bh=uwhmxIgXEicIVUPl90bIzIZ4ZmWc8rjNYFvJxQF5tdM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q6M4r8qaLOE3cXppsAcXe+rA/pl+j0Cmge4zNUYtqsJJXy2k7lYtjwcEvupc1kk0I+hUqxXsTTuHbMKaS876D5s91XoXcguSh7+U3Ec7JJbcrk32kpYmkpvtNNa/ScH9mjFrqjhqZwXfUZ4+/Jf7RPzsiKDYYvVbAi0fGmO+GUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAZJMEJo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAZJMEJo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0F21F000FF;
	Wed, 16 Sep 2026 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789569856;
	bh=uwhmxIgXEicIVUPl90bIzIZ4ZmWc8rjNYFvJxQF5tdM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UAZJMEJoIrpN4mrmvTg+GqqOc0DNoElQYyeGlNiOmgEsiRnNLfSJk4WAoYyzWRYza
	 kz6qPUBapiu/W32MPCnGqBhG6tTk/+kLwSDbRfixn7ea1WbtrIfqJCogczrcnLi+gQ
	 dbhul5tYVbrewOodCl8lC+tta11EEfi/irQfhX+4qm9kqT4uFjdKc0kb1xOnJAXOZu
	 tVlJhb4jiadjgB01V0c7MlKDdugO7SYeKtupEe/4aRZr/B3dktPxU4ibGyYGmT5hH7
	 9BdqJl2pOMMMdEQAVS7VpWZiDCd6KIULa5/V9bpgpJJj+YblUUfZY3amzHBL6SclLP
	 E+kfbTLBJPoUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/4] mfd: intel-lpss: Remove redundant DebugFS error
 check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260916-intel-lpss-debugfs-v6-1-5c118ac430ed@gmail.com>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
 <20260916-intel-lpss-debugfs-v6-1-5c118ac430ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 14:44:15 +0000
Message-Id: <20260916144416.1F0F21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The DebugFS API is designed to handle errors gracefully.
> Any explicit checking on return values is considered an anti-pattern.
>=20
> This patch removes unnecessary error checking and converts
> intel_lpss_debugfs_add() into a void function.
>=20
> Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-intel-lpss=
-debugfs-v6-0-5c118ac430ed@gmail.com?part=3D1

