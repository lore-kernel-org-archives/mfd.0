Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440869;
	b=xzrYJcZ0Nw9YsppxAjqLTo7aKttG8gjRojQagrcV0MqxdHLL7gTIxLbwx3jWi9HL7uVw
	 UJeIhOXw53WorAimDgphk0IXI3grXgzaTmUV889cxlN3Ue5bZ1OAP5sWQmu4bmNlCdi8i
	 O+Cc3ywY64fXqXph7ym4zXGlpVfaT8qoFcEh2NW8uUB9sUE8yQ64CGsDwal/wAITMuab6
	 pSSSBu6GOskXspQStD7fewFHsjBXBy/eAleFa2b9HBO0W9JERxgbR+hD9Fe10lJwBd+/N
	 z4MHRlD2Al1ogm4pX9G+qex8LigXpijKOOYcVG8vatSdX5Du984JGg0WRsmY2fiCzTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440869;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IuG2wh4XCrrSwM+WSkP83g1kovm23ons22I4k8Qw73o=;
	b=gswRhchJTdX7xYzG+6PmxiBJ1v8m/YH5drAs+QKxNWlS55OCA/AjIgE7d+GVnU5jk83E
	 Ou+vzPst/GSOUI8SQDqyjyKgWN3+00yDG299pwandei5kjrwDdEcUKSK5btB2pME5Owrt
	 xBxscvMv283tczzWJkbE/UmtBOWSXALyR/uwcxAFMEbzvuLCEm1BF/orn+I9s2yQixPqv
	 3MvRwlpSCstC0cU+fxil45CUSaGgkx/znzmDWYGzCe+N5XT3I21WUUi2l9hX/ta5s4bhd
	 BED59o8zQQupl6Tnq6frZ6RM4UEUKWtZuv1NYomwehG1IIw3maoGifM/FmRj0A9rBvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EWUBeDpn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A2C606A31A
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EWUBeDpn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6651F000C6;
	Mon, 23 Nov 2026 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795440868;
	bh=IuG2wh4XCrrSwM+WSkP83g1kovm23ons22I4k8Qw73o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EWUBeDpnO2RWQ5vlF86zXI5lVoEdMmWDdDRw34eB+PPIBszI/8/7+FLnsJ5GBeUG+
	 BhYp+ycI7F5xSeD/lBoGjgtp8f6lumH0IuT5Y7E15CMyDqzXMJx1pPcB1cA+HoIzYG
	 XafPNdMPqehvU7lObFd7MkQI+1U2CqtZdbCqer6TbEZc758fT49dw9cHxspgAYqh0t
	 oEMA0LQUmD/P4KJojLnh63kP636BPWl5u+nSQt2HjQ7pLpBS6TruJPBOv50Pu12kBk
	 28YSUxbQlsD8zYKoth0oAjkjNqcNTEtS8S8DBxSrKbvPPXgGGjJbaZfFpKrRXxn61f
	 LK45CQL+2AZFg==
Message-ID: <sashiko-outbox-229324@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/4] mfd: ocelot: Support the LAN9645x switch family
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261123-mfd-ocelot-add-lan9645x-support-v1-0-567d811fe1de@microchip.com>
References: <20261123-mfd-ocelot-add-lan9645x-support-v1-0-567d811fe1de@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 13:34:28 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has reviewed this 4-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-mfd-ocelot=
-add-lan9645x-support-v1-0-567d811fe1de@microchip.com
