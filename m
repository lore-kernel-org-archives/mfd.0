Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794741177;
	b=U5x/uv31KUKMxirguN/AF1b3LrzpKE7mikxQDEtQ0AVcI8gIpikCJVr/1RDm5oEqXuhG
	 F6d8HyM0plXF/LYbl0IYPLmdWiDMCuMeTH+/v8u+aUFjgeDvglDI9wvik6wtaGt1mNher
	 OddNG/EeovJw0tXZnvfUhMBdlu/6bEgaSwjE5XL25c48rUqUY6iwofQ7yPHJUjpiT6y9q
	 kAN08gDo2CmUymvC12OHixM+HGH8TV1S1CMRBlsan1/ZMuXPXwItjcQxFsriH7qL7uJjC
	 5uT7kzCYb3C4vpRhyNHzkOiDiZSXD6jM4EmjJyMblWYCtltOx/u008Ugk7UkT7ShqgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794741177;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=Wtgom5SxqHDtHqRwD4u1SexlopRYafHtKihIR5rv3L8=;
	b=lAdqxOWwehDHmVY3YXyttVDMUYqEcfM5Zz2Y18tUOQx0pLpbtAoudvJNLmEZmv28Wj2a
	 93VcGjVXQliaUAGq0/gsrY5SLz1UlbwqgDLHsRaQC6DG4mt288crA2/g1osEyeIbTI5HJ
	 PDbzR9fFRYFd+BGa56/SdL9SCu5/THVV9k/jCPd8UDs+tMu1LkOTIY58W17KHgaoCzQyD
	 sOq3DeBwAsZRTerLGTsIis16tTu1ynfRF0PbUjtN7OUxbAy6HR3qyzfjqGBsa4hPe1Cdt
	 0W9douh1JEOlcrZLSybtRhghtH30RYRrsVmfuKA78OqhpnE9FwaJLZFbCNncVdQ8FCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=YnOTpAOn;
	arc=none smtp.remote-ip=198.54.127.71
Received: from out-zbxj-a71.jellyfish.systems (out-zbxj-a71.jellyfish.systems [198.54.127.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EEE606A32C
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 11:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4EEE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=YnOTpAOn
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jS7cp6Fkdz8sWV;
	Sun, 15 Nov 2026 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794741153;
	bh=Wtgom5SxqHDtHqRwD4u1SexlopRYafHtKihIR5rv3L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YnOTpAOnG/bKK6ONGaUdDS0OeJWEzHI6Ua48oTmWyJyCOtqQ+dP8MUs9LSuWKu6Jt
	 mQUpcSq8G1swf37deu91PLjTQMU54LnVNY/8OXWw6l6MElE3sOPeUQRBn81Nh9DrDZ
	 JIPkdcQNyrJhZo7EmQFPokBWEkZcwNFRtHMqrXSVl56Gbl+Kv2A7ZJNWog1tVMCEDm
	 mgBNRT8pfpjvWP4SiEZwnyVT7PWyHIKTkZoiVKgMeYWjuoPnTw68p0c8VNOZgOdwlt
	 GuosHlVZj7MgVR95fIFQIqduV3DufEFYvzO85VStgsXX7NIU39qFHVUQIQpwR9K+5d
	 LFhaa3X2FqO+g==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: broonie@kernel.org
Cc: lee@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jerome.neanne@baylibre.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH 2/3] regulator: dt-bindings: ti,tps65219: Add ti,no-warm-shutdown
Date: Sun, 15 Nov 2026 14:12:17 +0300
Message-ID: <20261115111217.371268-1-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cedb08d0-cfa0-452d-b4cd-511d6c852eed@sirena.org.uk>
References: <cedb08d0-cfa0-452d-b4cd-511d6c852eed@sirena.org.uk>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: dev@chrispinetinega.com

On Sat, Nov 14, 2026 at 02:20:01PM +0000, Mark Brown wrote:
> Reviewed-by: Mark Brown <broonie@kernel.org>
>
> though we might still want a runtime override for when the user is more
> cautious.

Thank you for the review.

I agree. Looking at it again, a cautious user also has nothing to act on
today. With the warm warning masked, the warm interrupt reaches the
regulator driver with no regulator attached, so it only logs "Error IRQ
trap warm temperature". Nothing is notified.

I would rather keep this series to the board default and add the
override as a follow-up, once there is a user who needs it. I would
also change the binding text in v2, so it no longer says the operating
system decides how to react. Does that work for you, or would you like
the override in this series?

Chrispine
