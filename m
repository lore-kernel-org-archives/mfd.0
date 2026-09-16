Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADA84A6CE6
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574058; cv=none; b=qZaUZX4SGl8lqdkHCWXrMoDbaNFPm2vha9QP0jKPIScwiM3P8ZZo4NOSXn880s52aJQCwjC9z4EtbUS2f6PI5+f45E2gO5l7MRA33WLoB2kGzIEGs0Dvdiw50bA8JDSyziL1XesA0Dzl48vVqxQi5pRBA5FN1/xr63lnxMsjw3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574058; c=relaxed/simple;
	bh=Un72WoZT8gYUqQrO9W8+rWOjRXJKWQuSMylkHXu37yI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWUMYYE0BWzdlzOAifgPjtcQjUy0dyDpzBgi/kCVkHAtwDOnKAHhbX6AsjAzNMFsEPpIIGomuLl6E+TKUD5I9Z2mg5Ike/XKfdgzjy4uVUr+UDFr0iQqpRrO+jE+ptxtN+qsMAWPI+51PNrPrPVD/LcGdSCckjNPNsdN8OL6WJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbiYDWB9; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbiYDWB9"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so1424043e87.0
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 08:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789574053; x=1790178853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Un72WoZT8gYUqQrO9W8+rWOjRXJKWQuSMylkHXu37yI=;
        b=AbiYDWB9zeaPzH13XxXpSCsDQ/7eqiOSxhaaQna6OxTPUPR6CKGXc9QIR194xYRXzS
         Tkvy5BwtiKWvHSFWStFae8wInMbGz0ypLQTZv+NBBuac2kTuVl/WGa3st+jsKTwy0R/1
         jmMoZw+u9s5gNB0imguSM+KRUDtdEU5HSixPSOkW0Aat9LZGaosQCYtlA6FuhGS44AvQ
         LNp3WnJkCfKkJRUQKwzeynJqUI5hCjS5bhKzHycLy0+3lAv661+kr7yGhCsLCjxDvDuY
         WrUvod0KFV/kGmiGub3H9xg4lS3DNiX3YoFn+UuEhLXpcaZT83nL8egPq85htfg2wP+j
         iCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574053; x=1790178853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Un72WoZT8gYUqQrO9W8+rWOjRXJKWQuSMylkHXu37yI=;
        b=HMeZb0fdws/AxetXqg2kLdCWlUBLBAMQ7+UAvfCEyvuoPlyQJJgSRAe6CKs/pYW2yP
         psEbI7qbOsNOco86jZRyajCY3aj/7YAcaZukkA0154MzwEMbOyvFNAne83EO62MRxzWS
         X6RA5MnbeoW90T1c4yCH78DgMWiWlb2IhHz6AVIa7grl4VdkMP4TDE2TPnOaW030dPOu
         x1LfHaTd3oI+/QBL47BQV6XzUx+ebGIm8lhFFcPj/spE9lEs54ELUzAa8zbRAftp1QVQ
         fnNQCi7ye6tixDk/wOJYlXXjHBhAjq9AvJk7D9YJEe4BnYiv2n8rJ151p3BALl1Rn7HH
         xEzA==
X-Forwarded-Encrypted: i=1; AKwUvBzSJoYoXoaLw5Wxcq4JbK4f4zF2eUQ1P3Kks+HuVhR3BVEV6F/viqoV6bJf0zM6pKBiRnk=@lists.linux.dev
X-Gm-Message-State: AFuF++kW8xnbhGNl0LvQPkvGLQhyHhsRNM/Wk8VOqI8Gopf+tXdpixOZ
	wO2jXWB2GfuVfcBzDhbdt7pp2n3XX3jFCIJCmgzShq87OxljZC3Fi5i8B1VY9qE4gCwE
X-Gm-Gg: AYBFou0XYSvJY1HnNoMLx4ernNC/yeO0BB9HdWP0XRBPpIKtRgrbBRHCwOc+V4ncNUo
	+SKtsMjEkCbMkbIGNvMbUybSYzhK7xwa+l2iOJRYav2ZpziSPKB27wB3LM+j6/3NYHHjtmJt4Mw
	YyvbDTQD6ZMzIUhsML+gphB/49/GM+vuhCVs9HvYNWLEFFchBuX2B7ROIQ4fK39tSGmBO4RErun
	XRib/Br/WhCVBPoJwnq37oNd8HbHWIGxhPvr8E2o9qcUdJtABw76e83ApnjNTi8ukdHxvysiFCA
	9PZJ3rKL+ZCqD08OmqfppoXfz4t7j3Hc3yyzzzjWQvrxP9nLYbuz3nWoAxSlZgw+aIDMi90kJtH
	cIUdnFLAxDOYBT6RIh4r9IG1mDGCHOqlw8lhFXMzwzNyDpSv7SxAA1knwxFg3ElRZiCXZ1ENn0H
	hoxti+kdLxydE9SgacCIEHr9uGjMRNu+y7cTMRA2yXu+HbXEzVuojUoGS+/sfYgYMFQtvJAQGb9
	PFKNx//qro36N6Qvs4ZuMHtRKuhtGjSAYzRfA==
X-Received: by 2002:a05:6512:3da8:b0:5b6:1a7c:3b with SMTP id 2adb3069b0e04-5b8b666e4a8mr947500e87.62.1789574052531;
        Wed, 16 Sep 2026 08:54:12 -0700 (PDT)
Received: from localhost.localdomain (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57cc55csm1017913e87.36.2026.09.16.08.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:54:11 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: lee@kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	sekoohaka.sarisan@gmail.com
Subject: Re: [PATCH v6 3/4] mfd: intel-lpss: Remove extra DebugFS dentry
Date: Wed, 16 Sep 2026 20:54:07 +0500
Message-ID: <20260916155407.47647-1-sekoohaka.sarisan@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aqq5d5ESVulYfOnK@ashevche-desk.local>
References: <aqq5d5ESVulYfOnK@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> As Lee pointed out, we are fine with 100 limit, so one line here and below.

But doesn't the guideline strictly say no more than 80?
