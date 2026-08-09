Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD04B3D6CB7
	for <mfd@lists.linux.dev>; Sun,  9 Aug 2026 20:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307346; cv=none; b=jsTZ5zpdgAPzq2Kv9KdzcaV0FTryG+Z+gjf13r/PJBo35Og7XehiU14Lx496l6ukTQydUqsBZOM5OIeJPlkkbiosHBZw1W6QESWsUUWAXB/VSmLv989s2Nb6sroIkkMZk8TN3tAuBKVwEuG3L4rRIJljEnnzSdn290NhmdM0WCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307346; c=relaxed/simple;
	bh=IzRlEU23yfQQ6x4BYmQXGZqejxD9TteX1wiEO5R8YME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aUAGiddbeTj5AoNCxRV6OY+wl52HHpn07U/2+xTbsjfWG4YU9sUSBQE3NA3b6H9Pef27o7VlS4540xS3ijrxemg83rxZLmGScUgKiOa9+dgwZ9BpasJ1VeD6gKT6/e2kQhOYoYPs4wCjI1h/7W0rDdMeFa4oMSTqFKZ1RkUQVQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtHGplrP; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtHGplrP"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-459281bc13bso661438fac.2
        for <mfd@lists.linux.dev>; Sun, 09 Aug 2026 13:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307343; x=1786912143; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyzPxN0hN+8W2JU9IAdx12pcVnDBJDk0tQrb35djIKE=;
        b=YtHGplrPri9AStrCw3zDFXIZr36VmANiafF3Sp8MrXJ8ZfIqIUgmHveBeicJS2O8SM
         siXWyqKBRH43XZR8qXcLeAyOzNAOWMtCjKhaUEs7opH3NAiqn4Iv3roUqxUqokIfXKNj
         oXqxD0R58WejRanoC7DiwLGeQqV21l10a5+kLmX2Px6pGu2o7befQ0FKk19FeaQVFM9F
         Uhhxog2/9Ve6QIoyo+k0jm6gcI2LVK5SPNN9gFPZ+xQV3605yN0mc0rxnhGNexmik6vZ
         sqF3hsZy8t4HVLT+ZZ7DGswSavdIhvhXG0kJQ2Dpq0UTo+hTb0v4PSYPnlPwouiulnQ8
         knDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307343; x=1786912143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyzPxN0hN+8W2JU9IAdx12pcVnDBJDk0tQrb35djIKE=;
        b=sLvYqpAd6zxGLUoK6u/d4JOZblUOhlmCuaSMF2hbEm0/inrv9yWfhsNg8JPG9TKjAz
         FrFGDCy4gdyh7BemuhC3siFdpC5Cvt6aAwV46PnYn2UqokKga9aHt4JMHLKFaOxcHZLh
         Y+Suwx3cuKQtl5Nq3y+T61+XV95FxgCe2vkpZP1+NQkmkjQM6PvH3RzeQ0FwsONFnkM2
         eCYHbk0uRHbbXJmwt7YEzaAmpO7eBieuznv1XlCtrW14ixLA6H08o6TmVKMxZC/99wxK
         CdaAF/4F4aNnyXEb4z7IEvmi10YGbUzFRZsqQGhKKTI+ZlP0TmaneSBF+XOJ5GYNeRPB
         yWFg==
X-Gm-Message-State: AOJu0Yy2tAKwr70HlXyJhHHfR1zZgaFdg3LO2ahxI807QF4Edohxh0O1
	GWox3y/M+Pdw49yaCoj77ZNOH8rkHivWtaqqUfvkVytlDqM4MXCmyodwa6lbcw==
X-Gm-Gg: AR+sD13LUpEW94f/ZvSTB4ELj2Dr5IKKBo0MBu1gj7yfDz887XSz6ASdXw1Cprg7sDn
	fly12VcTBVNZZvqpD3m29xU+BJBoqJyO0JbgAZeqXTSACJsfwZXH69ejP5KMj4XJ8MNnvhk3sNF
	WaQORePgd0aHkpuO3ljWG2V4+YcX9ftfD2lJdqmivSsM3vA0W15sKmBcY+lqxcMXrth8kJwmA2O
	juT3jkWtJKajr4PUYRNNlTHJlrVXGvB22nl71SP2SFkmlfsLkBeLRVuGW0fSzjKUlOgKc65nCM5
	tniK+6mO5xQoKfJIQYjNRbkKCzCIsxb/CFJx4qR5gy+6mdgiXMSW8p/iuKNj/zUhjOmWwu66htx
	9Oh8FcMP6DsjitJf7b9DnxM7AZPxCPVDq0R0IxgTH1M5cCf4+3rekqM1hCIGV/XgXP0EE6jcESI
	dIslxkY6tTb0J7T0QiVDOFmqJYOAwNCUswztklfGML/JzyibfeXvdt8S1T3Su9zPVw0oSxdHcJq
	MsMQSLA7NMKuMt5LJPtcUpSXaqIBGyEau910BjnBEi3QtzWrmCNr1gSzvKN6CMfIikBIEsCJE/W
	etjiqlhIcVhWGd+NRcUrYQUkZd/QpIsdJ6V1Kb8nsM2cSpKTz92ZODIoiTrcwtlewa66/9eOqQa
	VYR3IjMQSBtJ/Xb8L
X-Received: by 2002:a05:6870:2482:b0:451:ecac:2c13 with SMTP id 586e51a60fabf-459e2a47b11mr13178902fac.8.1786307343529;
        Sun, 09 Aug 2026 13:29:03 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f19fd31csm6975362fac.1.2026.08.09.13.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:29:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 09 Aug 2026 14:28:32 -0600
Subject: [PATCH net-next v5 2/5] mfd: syscon: Add managed registration for
 external regmaps
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-submit-acx00-of-dynamic-v1-v5-2-bfa1f8518b28@gmail.com>
References: <20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com>
In-Reply-To: <20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2

of_syscon_register_regmap() publishes an externally owned regmap in the
global syscon list, but provides no way for a removable driver to
withdraw it. Registering a devm-managed regmap from such a driver would
therefore leave a stale pointer after unbind.

Factor external registration through an internal helper and add
devm_of_syscon_register_regmap(). The managed action removes the entry
under the syscon list lock before later devres actions release the
regmap. Hold a device-node reference for the lifetime of every
externally registered entry so its lookup key also remains valid.

Consumers of a removable provider remain responsible for ordering
teardown, for example with a managed device link.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mfd/syscon.c       | 87 ++++++++++++++++++++++++++++++++++------------
 include/linux/mfd/syscon.h | 12 +++++++
 2 files changed, 77 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 21a7fcdd2737..448422fe4f21 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -10,6 +10,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hwspinlock.h>
 #include <linux/list.h>
@@ -193,53 +194,95 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
 	return syscon->regmap;
 }
 
-/**
- * of_syscon_register_regmap() - Register regmap for specified device node
- * @np: Device tree node
- * @regmap: Pointer to regmap object
- *
- * Register an externally created regmap object with syscon for the specified
- * device tree node. This regmap will then be returned to client drivers using
- * the syscon_regmap_lookup_by_phandle() API.
- *
- * Return: 0 on success, negative error code on failure.
- */
-int of_syscon_register_regmap(struct device_node *np, struct regmap *regmap)
+static struct syscon *
+of_syscon_register_regmap_internal(struct device_node *np,
+				   struct regmap *regmap)
 {
 	struct syscon *entry, *syscon = NULL;
-	int ret;
 
 	if (!np || !regmap)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	syscon = kzalloc_obj(*syscon);
 	if (!syscon)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	/* check if syscon entry already exists */
 	mutex_lock(&syscon_list_lock);
 
 	list_for_each_entry(entry, &syscon_list, list)
 		if (entry->np == np) {
-			ret = -EEXIST;
-			goto err_unlock;
+			mutex_unlock(&syscon_list_lock);
+			kfree(syscon);
+			return ERR_PTR(-EEXIST);
 		}
 
 	syscon->regmap = regmap;
-	syscon->np = np;
+	syscon->np = of_node_get(np);
 
 	/* register the regmap in syscon list */
 	list_add_tail(&syscon->list, &syscon_list);
 	mutex_unlock(&syscon_list_lock);
 
-	return 0;
+	return syscon;
+}
+
+/**
+ * of_syscon_register_regmap() - Register regmap for specified device node
+ * @np: Device tree node
+ * @regmap: Pointer to regmap object
+ *
+ * Register an externally created regmap object with syscon for the specified
+ * device tree node. This regmap will then be returned to client drivers using
+ * the syscon_regmap_lookup_by_phandle() API.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int of_syscon_register_regmap(struct device_node *np, struct regmap *regmap)
+{
+	return PTR_ERR_OR_ZERO(of_syscon_register_regmap_internal(np, regmap));
+}
+EXPORT_SYMBOL_GPL(of_syscon_register_regmap);
+
+static void devm_of_syscon_register_regmap_release(void *data)
+{
+	struct syscon *syscon = data;
 
-err_unlock:
+	mutex_lock(&syscon_list_lock);
+	list_del(&syscon->list);
 	mutex_unlock(&syscon_list_lock);
+
+	of_node_put(syscon->np);
 	kfree(syscon);
-	return ret;
 }
-EXPORT_SYMBOL_GPL(of_syscon_register_regmap);
+
+/**
+ * devm_of_syscon_register_regmap() - Register a managed external syscon regmap
+ * @dev: Device that owns the regmap
+ * @np: Device tree node associated with the regmap
+ * @regmap: Pointer to the externally created regmap
+ *
+ * Register an externally created regmap object with syscon and remove it when
+ * @dev is unbound. Consumers must stop using the regmap before the provider is
+ * unbound, for example by establishing a managed device link to @dev.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int devm_of_syscon_register_regmap(struct device *dev,
+				   struct device_node *np,
+				   struct regmap *regmap)
+{
+	struct syscon *syscon;
+
+	syscon = of_syscon_register_regmap_internal(np, regmap);
+	if (IS_ERR(syscon))
+		return PTR_ERR(syscon);
+
+	return devm_add_action_or_reset(dev,
+					devm_of_syscon_register_regmap_release,
+					syscon);
+}
+EXPORT_SYMBOL_GPL(devm_of_syscon_register_regmap);
 
 /**
  * device_node_to_regmap() - Get or create a regmap for specified device node
diff --git a/include/linux/mfd/syscon.h b/include/linux/mfd/syscon.h
index aad9c6b50463..3e804fc1b03e 100644
--- a/include/linux/mfd/syscon.h
+++ b/include/linux/mfd/syscon.h
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 
 struct device_node;
+struct device;
 
 #ifdef CONFIG_MFD_SYSCON
 struct regmap *device_node_to_regmap(struct device_node *np);
@@ -30,6 +31,9 @@ struct regmap *syscon_regmap_lookup_by_phandle_optional(struct device_node *np,
 							const char *property);
 int of_syscon_register_regmap(struct device_node *np,
 			      struct regmap *regmap);
+int devm_of_syscon_register_regmap(struct device *dev,
+				   struct device_node *np,
+				   struct regmap *regmap);
 #else
 static inline struct regmap *device_node_to_regmap(struct device_node *np)
 {
@@ -75,6 +79,14 @@ static inline int of_syscon_register_regmap(struct device_node *np,
 	return -EOPNOTSUPP;
 }
 
+static inline int
+devm_of_syscon_register_regmap(struct device *dev,
+			       struct device_node *np,
+			       struct regmap *regmap)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif
 
 #endif /* __LINUX_MFD_SYSCON_H__ */

-- 
2.53.0

