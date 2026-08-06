Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E6185B48;
	Thu,  6 Aug 2026 02:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785983566; cv=none; b=h83rZ1KtBeowd3ATKZhC2+ZtYi70H7tcXtc5YzDMf8FxBPGuGtjJRu4jGGeBfSQE70rEMdqon2CH1XUNNmcQcHIZwOjUQGyxKowf74SxAij0sMYbKQaD97lACnJVmpTuyuoDH15zSRcrmO0HkRrYplYjUEwSh/b1aC/os8wnz3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785983566; c=relaxed/simple;
	bh=dV2wROHOctWtqTGp3D8UxicqszD0G+swtpn5NBNzJZk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ET8wYY7sm7H3V0QslPueM8tioaHGm0NdiEhRcVOrQSfEaZsFCjuq6lP168wVFV+hfosleU3g6OHtKwM9+4NE7FhHQ8iJGEnEkw/05rCwEELe3LIyn13iCCXOtr0KJ4UTNBHbOa01MGzU3yaSOd+i2lBnEdtBEtCx3vHYrCYYSng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFalsJbX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFalsJbX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783D51F000E9;
	Thu,  6 Aug 2026 02:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785983565;
	bh=dV2wROHOctWtqTGp3D8UxicqszD0G+swtpn5NBNzJZk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EFalsJbXGvYqoUM0fhi1IpF/rcZ5EKjt6NAbYL9+8ycbnOJMuZAQd+yNRddZFN9X6
	 ibmvcLXzdC8fEAgOofO6tu+d/IDG4oMhe4KPuTKjvZJ2+TwTQGFBDtv2QDdmj3TFD+
	 nBaF93D1RXChB4wgEjwo1qS+0+qrb4Pmx8S+GPXHm5hlzLg3z/OoMf2VeHnZunHCn8
	 LwQf6g95wru7h/QYcIY2lAreEdgvl+eu3U2G3UNmeXq4s1QHckAcXD5TAp0q66hhZ+
	 LFWy5xp43CuP27YlyAo7AcKDJnOfIQE+zXUwRcd36Gt0AHRHAD8BUUmRU2/htPN7wP
	 FNgu+LP74wtPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 5/8] dt-bindings: net: x-powers: add AC300
 EPHY control
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-5-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-5-3eef49ff1d8c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 02:32:43 +0000
Message-Id: <20260806023244.783D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AC300 exposes its Fast Ethernet PHY control registers through a
> separate non-PHY Clause 22 address. The manual defines that address as
> the link PHY address plus 16, giving control addresses 16 through 23 and
> link addresses 0 through 7.
>=20
> Describe the control endpoint, its required VCC1 supply, its 24, 25 or
> 27 MHz input clock and its SoC SID calibration cell. The actual PHY
> remains a separate ethernet-phy node and supplies the MAC-selected
> interface mode at runtime.
>=20
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-submit-acx=
00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com?part=3D5

